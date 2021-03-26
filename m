Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAAC34A267
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:16:05 +0100 (CET)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPghQ-00020l-70
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPggQ-0001Ze-37
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:15:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPggO-0006oK-5C
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:15:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso2036184pjb.4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hkm2bTaJlg5wLoyHm/cVFU3hN7lIPF9gdNrggF4hvEc=;
 b=GY4gR2BlIIP28XegkgwAn6Kl8mCdJQOrnnaC4o1Wglrf5y4fHkfI+zSD2zn58FQTkA
 74xM1X8fpMp7XemcmtSxzFv5xFon6V3g5QCsVj9vYsuKjicAtzKLNNSFKoiSrEW3nsVy
 Tdc/TEVVOLv13YSBYWHWoijH+0d8KzodgqL8elxVvimaRxAlqeCa+/GgopwC+Dl8QQik
 scjona36ByDMD02mTmZ0GiyQAhfg5IY80TGlX9+3T+6YdL6ywrKPc+ISQHSYMxS/WaTY
 wTT/6+2jy0X9m2yitcvuOROkUdBP9HPxD0S0bEcXpn8xOaaBsTdOdNzve1f/9C8y6x8x
 40Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hkm2bTaJlg5wLoyHm/cVFU3hN7lIPF9gdNrggF4hvEc=;
 b=lZ0fH+c5LdWvSzU5OVOyHbAt5dpC9zIZLvuHpVSJtX1pEqJUrqzb2OqxYd0bMhTU0y
 2jpfbSijyzB+Qo1216BxZu0IoaWsIgmWcE5+extu2MEjKMu/xZqpNhhqMbAOdj7sLnO/
 ee1SBjLxnsUkuVIYOKjGaMH9y09TOoV4VHEJrTCEkAjESWGVnUnShyDkpKE0B3eSiFJw
 yYJUxif6TaB1aVlpBHCEqE8mNr+QyPCLiBuQEqRxYjujzDt3gskwd03qaFWE5vD9V3wS
 iW32YxjgJ4Tm/G3WU8///LSdoeQfwUQr78T2rEGyE7TRtKMu4zNsvff9qB3Ym+xHLgdA
 TFIA==
X-Gm-Message-State: AOAM530A5KwEd0ynk6e00hzMFDgZ07Gb65nCI5YYPUPV8nJSW2Jxv2QV
 P1bx+7ILARDzeSnGvJzKAE0jBw==
X-Google-Smtp-Source: ABdhPJw8KmCIKmx6/9nT1dQ+omtGV8TijODVwMZM4CN3U0SANfXlaR9lzpy67j9GgyD9MItM6t4p8g==
X-Received: by 2002:a17:90b:f15:: with SMTP id
 br21mr12621470pjb.234.1616742898492; 
 Fri, 26 Mar 2021 00:14:58 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id w203sm8135376pff.59.2021.03.26.00.14.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 00:14:53 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:44:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210326071451.4m6ff5on5kwznx3v@vireshk-i7>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25-03-21, 17:16, Arnd Bergmann wrote:
> On Wed, Mar 24, 2021 at 8:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +static void vi2c_handle_ctrl(VuDev *dev, int qidx)
> > +{
> > +    VuVirtq *vq = vu_get_queue(dev, qidx);
> > +    struct i2c_msg msg;
> > +    struct virtio_i2c_out_hdr *out_hdr;
> > +    struct virtio_i2c_in_hdr *in_hdr;
> > +    bool fail_next = false;
> > +    size_t len, in_hdr_len;
> > +
> > +    for (;;) {
> > +        VuVirtqElement *elem;
> > +
> > +        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> > +        if (!elem) {
> > +            break;
> > +        }
> > +
> > +        g_debug("%s: got queue (in %d, out %d)", __func__, elem->in_num,
> > +                elem->out_num);
> > +
> > +        /* Validate size of out header */
> > +        if (elem->out_sg[0].iov_len != sizeof(*out_hdr)) {
> > +            g_warning("%s: Invalid out hdr %zu : %zu\n", __func__,
> > +                      elem->out_sg[0].iov_len, sizeof(*out_hdr));
> > +            continue;
> > +        }
> > +
> > +        out_hdr = elem->out_sg[0].iov_base;
> > +
> > +        /* Bit 0 is reserved in virtio spec */
> > +        msg.addr = out_hdr->addr >> 1;
> > +
> > +        /* Read Operation */
> > +        if (elem->out_num == 1 && elem->in_num == 2) {
> > +            len = elem->in_sg[0].iov_len;
> > +            if (!len) {
> > +                g_warning("%s: Read buffer length can't be zero\n", __func__);
> > +                continue;
> > +            }
> 
> 
> It looks like you are not handling endianness conversion here. As far as I
> can tell, the protocol requires little-endian data, but the code might
> run on a big-endian CPU.

I hope this is all we are required to do here, right ?

@@ -442,7 +421,7 @@ static void vi2c_handle_ctrl(VuDev *dev, int qidx)
         out_hdr = elem->out_sg[0].iov_base;
 
         /* Bit 0 is reserved in virtio spec */
-        msg.addr = out_hdr->addr >> 1;
+        msg.addr = le16toh(out_hdr->addr) >> 1;
 
         /* Read Operation */
         if (elem->out_num == 1 && elem->in_num == 2) {
@@ -489,7 +468,7 @@ static void vi2c_handle_ctrl(VuDev *dev, int qidx)
         in_hdr->status = fail_next ? VIRTIO_I2C_MSG_ERR : vi2c_xfer(dev, &msg);
         if (in_hdr->status == VIRTIO_I2C_MSG_ERR) {
             /* We need to fail remaining transfers as well */
-            fail_next = out_hdr->flags & VIRTIO_I2C_FLAGS_FAIL_NEXT;
+            fail_next = le32toh(out_hdr->flags) & VIRTIO_I2C_FLAGS_FAIL_NEXT;
         }
 
These are the only fields we are passing apart from buf, which goes
directly to the client device.

-- 
viresh

