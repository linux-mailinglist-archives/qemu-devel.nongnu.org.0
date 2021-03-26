Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2434A15F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:03:46 +0100 (CET)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfZQ-0006uL-Sy
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPfXw-00068C-PA
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:02:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPfXs-0005YB-Sg
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:02:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so1953876pjg.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 23:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LQE5vTkllJJPhRUFhx01Jikc39aIQshB3aBWtUzxDnw=;
 b=VvBX7cNLrMu7auoQHK+3E/+/V2ebzH10VPU47TWuJMVWQ9qarGgmAByIgxTZaziJRy
 xPdiaL2c7LRughg3Hh8PhTxzIR0rUY/VbV12eGmCgXUWoettffyZ3nGYwXww5Jr9GoHQ
 CO76KXM3So/4K4pu2rshJK0B5HglaoBSgvlDUtmqXo/YR+NlqKqMyqGqFE7Qj+bwHzVG
 hs2mYH5YEio6lK/Eid8dOitLVVNHESeCvP9uWyIRdxG/zLkGwPbdNTX/SU8scMw1WYtH
 asWoF35//zFd9XJMMAHSDpsmGsKtE6e/qJ7yR5gNBNAVGVyTR5s0qnIo9NH0mgK20xRm
 pGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LQE5vTkllJJPhRUFhx01Jikc39aIQshB3aBWtUzxDnw=;
 b=fmm1ak43gCHuq7D/7u68RN3MzEJCJhw6A+oHTOALTiq3770WimUNOtANQOD49GzLMo
 o1eXCA9OQS+Ol2wGo4Ol2lXE8KOyQOCA/bRV4tJ6q8Ir8UcrdaQQwKZc2Nu/1alNrrbJ
 +oHA2NNaGmWkuqdkFx+JT4EJdCR6FKeip49p634xO/y/SUhWRBdw/azMy8uFjwml4elz
 SaogWRRpCu3ginZsHu+3N2AhNEhnxD7YHA6MveXJVxKdB5d0hVBkEe2Vxnh/8SYcSMrV
 ZnuD5jTa6K6Lk2xAOZss7ciEHCJDE3jAN1O/2QfXPIlF/1kslzCK90paE52W7rLliaL4
 Y63g==
X-Gm-Message-State: AOAM533nzKY/0x9P06wMgT9Kc/pAT7APkIZwT89/kg0kM3qkMabyWpwE
 Xwy1Yx+GoX5LdY9yDPepnG1XCQ==
X-Google-Smtp-Source: ABdhPJyoIo4v4LrMdixSjOtJCasCN0MWB1uVD2LVkSx9jOhv9SRG/AsAmThjJtYYHEBiymbOeaIpKg==
X-Received: by 2002:a17:902:da81:b029:e5:de44:af5b with SMTP id
 j1-20020a170902da81b02900e5de44af5bmr13536003plx.27.1616738519806; 
 Thu, 25 Mar 2021 23:01:59 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id gt22sm7084187pjb.35.2021.03.25.23.01.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Mar 2021 23:01:53 -0700 (PDT)
Date: Fri, 26 Mar 2021 11:31:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210326060151.lznoke6vmg5u5lvc@vireshk-i7>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1031.google.com
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
> 
> > +static uint8_t vi2c_xfer(VuDev *dev, struct i2c_msg *msg)
> > +{
> > +    VuI2c *i2c = container_of(dev, VuI2c, dev.parent);
> > +    struct i2c_rdwr_ioctl_data data;
> > +    VI2cAdapter *adapter;
> > +
> > +    adapter = vi2c_find_adapter(i2c, msg->addr);
> > +    if (!adapter) {
> > +        g_printerr("Failed to find adapter for address: %x\n", msg->addr);
> > +        return VIRTIO_I2C_MSG_ERR;
> > +    }
> > +
> > +    data.nmsgs = 1;
> > +    data.msgs = msg;
> > +
> > +    if (ioctl(adapter->fd, I2C_RDWR, &data) < 0) {
> > +        g_printerr("Failed to transfer data to address %x : %d\n", msg->addr, errno);
> > +        return VIRTIO_I2C_MSG_ERR;
> > +    }
> 
> As you found during testing, this doesn't work for host kernels
> that only implement the SMBUS protocol. Since most i2c clients
> only need simple register read/write operations, I think you should
> at least handle the common ones (and one two byte read/write)
> here to make it more useful.

I am thinking if that is what we really want to support, then
shouldn't the i2c virtio spec be updated first to support SMBUS type
transfers as well?

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
> 
> Jie Deng also pointed out the type differences, but actually handling
> them correctly is more important that describing them the right way.

Right, I missed that.

-- 
viresh

