Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F028732D147
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:59:22 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlhS-00042u-1A
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHleP-0000rG-TC
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHleO-00030S-A1
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3S5jDq82O0mLl/agYshU43NEUTkpVyyTX42Mm37YAQ=;
 b=Kp0xYrIkpveDI2HisisTGBFSQ74d0ZUTkb/qCOPnZMnz7/NSMpkfXExtaoK9bvzfIv3q8B
 ayJPZzVsSQe3P0bCTpSXjF6d31sETdNa7man2XEdgKuz8/Wok+M2vwHzAyMyqqM16ynkn0
 SkR3vbya1NjXZtsb8PARs3Wfigx31e8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-WV8Up_DCP76PdoF9HNkuNw-1; Thu, 04 Mar 2021 05:56:10 -0500
X-MC-Unique: WV8Up_DCP76PdoF9HNkuNw-1
Received: by mail-wr1-f69.google.com with SMTP id z6so5518194wrh.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 02:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/3S5jDq82O0mLl/agYshU43NEUTkpVyyTX42Mm37YAQ=;
 b=FBPmwu3IPbG2ZfFPxPVx73XoXa8lUpKYxKYAVQOQp6YftSMfXNiQBt4Y64IiRV+X9m
 8+w0At4CKnON9uP+J5iq7q0Ju9sKs3ajJTp3NH+gx1Bgdhkff4lsez5hr7dFpqPIo9Fx
 yLqAQ8eWOHxwI4XHsYb1xPXRUzt9os6mVlXyA/F7OoB9UCf3uHoh5Rksb598t6yob9S1
 UUGZa0mAbYG/Tpv3B27ggly/tqkHxI4dd747cSZwZG0iMA5ZxsSsPAAJkqEzBsJEq5QG
 UxliAIWe53WeSJ7cevhQQFVqdpEZrMskOF4tWFgr3Wcko3EAdyYWaqEb59uP2TMiyylW
 7pJA==
X-Gm-Message-State: AOAM531j1uqY7ixVFtbndN2bnpcLuDO/tKL95SZVe9CJS/XvLxCjjxBf
 K/EZcQh5IQue36LbVVB4mhRGeDEfPAo3rU4KlUY8qQcYBaUH3Ea7A7BA15z95BxXlc1R9/nSrEi
 NX8RIyXc5s5nvC/rw/s4TJ0Fg8k63nErQsilg0KvdqQIfIYutV4UPGRUMkJ+6NEfcb74=
X-Received: by 2002:a5d:644d:: with SMTP id d13mr3338478wrw.191.1614855367941; 
 Thu, 04 Mar 2021 02:56:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN3+EeMDdLpDe8ebRFA3zIi57hAv8cl/BofMPlbhDxIG1H7sezdTY+H92tNFVUnMFC5rtOpw==
X-Received: by 2002:a5d:644d:: with SMTP id d13mr3338451wrw.191.1614855367703; 
 Thu, 04 Mar 2021 02:56:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z13sm35979149wrh.65.2021.03.04.02.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 02:56:07 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
Message-ID: <5829357a-6759-8314-140c-214016862446@redhat.com>
Date: Thu, 4 Mar 2021 11:56:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEC4Rk/eAStVIFU7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/21 11:37, Daniel P. Berrangé wrote:
> On Wed, Mar 03, 2021 at 09:59:38PM -0500, Daniele Buono wrote:
>> For CFI, we need to compile slirp as a static library together with qemu.
>> This is because we register slirp functions as callbacks for QEMU Timers.
>> When using a system-wide shared libslirp, the type information for the
>> callback is missing and the timer call produces a false positive with CFI.
>
> Is there work being done, or at least an active plan, for fixing this ?

Daniele, would this work (uncompiled even)?

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..82e05d2c01 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -174,23 +174,42 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
  }

+typedef struct SlirpTimer {
+    QEMUTimer t;
+    SlirpTimerCb cb;
+    void *cb_opaque;
+} SlirpTimer;
+
+static void slirp_timer_cb(void *opaque)
+{
+    SlirpTimer *st = opaque;
+    st->cb(st->cb_opaque);
+}
+
  static void *net_slirp_timer_new(SlirpTimerCb cb,
                                   void *cb_opaque, void *opaque)
  {
-    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
-                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
-                          cb, cb_opaque);
+    SlirpTimer *st = g_new(SlirpTimer, 1);
+    st->cb = cb;
+    st->cb_opaque = cb_opaque;
+    timer_init_full(&st->t, NULL, QEMU_CLOCK_VIRTUAL,
+                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                    slirp_timer_cb, st);
+    return st;
  }

  static void net_slirp_timer_free(void *timer, void *opaque)
  {
-    timer_free(timer);
+    SlirpTimer *st = timer;
+    timer_del(&st->t);
+    g_free(st);
  }

  static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
                                  void *opaque)
  {
-    timer_mod(timer, expire_timer);
+    SlirpTimer *st = timer;
+    timer_mod(&st->t, expire_timer);
  }

  static void net_slirp_register_poll_fd(int fd, void *opaque)


