Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABDE301916
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:34:16 +0100 (CET)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3TM7-0000kb-EO
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3TL3-0007m9-TJ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3TL0-0006tU-K5
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611448383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+pI06b1r7YH4VIqSs+vN3SRg66T2NtRWpxktrRjGR8=;
 b=SSOkzPq2Ftcnt+aA0gUpoqLq0lezB3ZVGUZoT/hIEsVSpTcBu4KkVbnTmR7p4FyjYVPJ/H
 CgUzkOUBn57Cf+QAd5Qn7vaKkfIsb7nMJHvFn8VtEzIXZ3qoW5/lRQXICKxx825VKl6prc
 sN2ghKMGotSKOlvfX27RrB8KvTAGsP0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-fMtS-kfSMJSgTAA62sNBFQ-1; Sat, 23 Jan 2021 19:33:01 -0500
X-MC-Unique: fMtS-kfSMJSgTAA62sNBFQ-1
Received: by mail-wr1-f71.google.com with SMTP id w5so5246644wrl.9
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+pI06b1r7YH4VIqSs+vN3SRg66T2NtRWpxktrRjGR8=;
 b=E8rEYSHW8Nit7Uzms5Ug8TtP+H/lGZrNeLQvTO09fjScBEOBonEA8wuicyiyAVKOuH
 Zxarg4LJMzeecswDD9+7WWJb81eKcSftd+oHG8fB0lV9ne/87/6PUZTT+feGtaBNEKhz
 FoiHS1/GVmrZlHsW/OyrjzeQwadBjgGIIn//ETJ+6YJvfosxWY/9CFjqD9xVG2tnXW6s
 NbZDM9nkZOzl3/XUKsdF0Nz1JeRNYvwCPp7/xanX0E67rQGyvxPqMXCzROEReRP6hFMP
 6dhKJKvHV/zEoxkvBT0orG10mvAfcQigRIxHAbv3H6zCWQexmYKfpmCr94GMRl+9Q6wZ
 dLJw==
X-Gm-Message-State: AOAM531KRwh80ul2MLr1Lf7ESoiPPGY7Tvfyo91tfhVBC8HMt/0Rc6ZT
 3ndVuRdERlb3sUHTb5fWW69EZZ9DDfoP/G5B+NyE5WEa854EH5dlgeAf/neGsBejYc85JTMFVCl
 aXDu74XWkhdr+W70=
X-Received: by 2002:a1c:398a:: with SMTP id g132mr9818633wma.38.1611448380066; 
 Sat, 23 Jan 2021 16:33:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRb1UPdNWZ+xxetAXm28cs/w2nyBPbN3n+9EIYtk6KSJ4BL0PJHNV0nbxFN5s3x+EWLlFDKg==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr9818614wma.38.1611448379817; 
 Sat, 23 Jan 2021 16:32:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v6sm16380966wrx.32.2021.01.23.16.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:32:59 -0800 (PST)
Subject: Re: [PATCH v2 09/12] qapi/meson: Restrict qdev code to system-mode
 emulation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-10-philmd@redhat.com>
 <fcb116d8-8701-90cc-fabd-85983740f74b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <02ef2d7f-ac16-af21-a002-bc2165646dfc@redhat.com>
Date: Sun, 24 Jan 2021 01:32:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fcb116d8-8701-90cc-fabd-85983740f74b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 7:10 PM, Paolo Bonzini wrote:
> On 22/01/21 21:44, Philippe Mathieu-Daudé wrote:
>> Beside a CPU device, user-mode emulation doesn't access
>> anything else from qdev subsystem.
>>
>> Tools don't need anything from qdev.
> 
> I prefer to avoid stubs.  So if this patch can simply be dropped with no
> effects on 10-12, that's nicer for me.

The alternative is ugly:

-- >8 --
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..d09f32e38d6 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -950,7 +950,9 @@ static void device_finalize(Object *obj)
     if (dev->pending_deleted_event) {
         g_assert(dev->canonical_path);

+#ifdef CONFIG_USER_ONLY
         qapi_event_send_device_deleted(!!dev->id, dev->id,
dev->canonical_path);
+#endif
         g_free(dev->canonical_path);
         dev->canonical_path = NULL;
     }
---

Maybe wrapping it in an inlined function?


