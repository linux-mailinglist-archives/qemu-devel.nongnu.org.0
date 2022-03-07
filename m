Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C74CF93F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:03:41 +0100 (CET)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRADM-0000dT-0u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRA9q-0007Qo-Td
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRA9o-00028m-7z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVupuhISFWlneLp93m3bMYobfcsi2r+SOIEtiHSEsyc=;
 b=JWF/yqm2jwCKAKuDVrR8Zak+HLbngPdxP3C777DRn50uY4CtGUwPTIO33C6GMrJhoucTBy
 xxizGrpRshoytEsxAaqzeHXhLF1w69iRHzJqFrhKokS9JiJQn4TzcTz0LTd7zz03o3nJmy
 VDYSsHRl42k6c10gOHvXfeZsaR7akAk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-9lCFfAwjObmtzwsk-6vFAQ-1; Mon, 07 Mar 2022 04:59:58 -0500
X-MC-Unique: 9lCFfAwjObmtzwsk-6vFAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i83-20020a1c3b56000000b00389a203e5adso482205wma.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 01:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BVupuhISFWlneLp93m3bMYobfcsi2r+SOIEtiHSEsyc=;
 b=kdpixoB4XNoV03F0Cy+5xB9eu9z637S9iJS82Zto8oIhHyTPSEZhlKOZQOUHFzNv0k
 yDfJ8BJToVq7UxwBT3DfafhPDCk2IUk3NuCVDqlb1i4McTK3W0DEP5qOx1snAl+CN0Ay
 rRgbLSnAYAb/soEVg35s2RQGLe9Zmv+/74UGHA3CCIXhuuVPqezOn3FgtZLA8d5+d5au
 UrzPWjwxXINg5v6VgUFskliyUZ5h9Irmwc4Z5zJr66sqF4w8XHzOjuscYdwvhKz9iccA
 hKTEQFlWOCxpYYMMpBL6nxoN0Pb+avc4C6VUSsaOulY2nTwS1h2kznxoZfOaBf3L33A7
 sImw==
X-Gm-Message-State: AOAM532vxX1NPxGZLkp14LSAdje2j7amk/fjoLdJBu5iunixesZ80V58
 HWwr2YZXgeYmimWzMKzO18MdiRFQj7ruf31tm4l9pUZFydBCOLN3ucc2A4gnnuhrxv4qHWw07Q7
 veN8FoyuRj/cK0AQ=
X-Received: by 2002:a5d:624d:0:b0:1e6:f18c:d264 with SMTP id
 m13-20020a5d624d000000b001e6f18cd264mr7792819wrv.546.1646647196991; 
 Mon, 07 Mar 2022 01:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycox1BXtqbzQn84l2SWg/YIN6r/JBPFwemOq7hJ70SkQeR+kkMbWhpQ5PXQCJXbUzhlOC8Fg==
X-Received: by 2002:a5d:624d:0:b0:1e6:f18c:d264 with SMTP id
 m13-20020a5d624d000000b001e6f18cd264mr7792792wrv.546.1646647196695; 
 Mon, 07 Mar 2022 01:59:56 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056000137000b001f046a21afcsm11210038wrz.15.2022.03.07.01.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 01:59:56 -0800 (PST)
Message-ID: <6c402144-3ac8-fb62-ac9d-6e5656b51c9c@redhat.com>
Date: Mon, 7 Mar 2022 10:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 2/5] qtest: replace gettimeofday with GTimer
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220307070401.171986-1-marcandre.lureau@redhat.com>
 <20220307070401.171986-3-marcandre.lureau@redhat.com>
 <673b8beb-352a-df7e-27af-7f81022d5adc@redhat.com>
 <CAJ+F1CJgpC5JQ=Duw7vk8oF+fK9M0=ecqv+HVVaZS67FGY8C=A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1CJgpC5JQ=Duw7vk8oF+fK9M0=ecqv+HVVaZS67FGY8C=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 09.05, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 7, 2022 at 11:46 AM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 07/03/2022 08.03, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>      > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      >
>      > glib provides a convenience helper to measure elapsed time. It isn't
>      > subject to wall-clock time changes.
>      >
>      > Note that this changes the initial OPENED time, which used to print the
>      > current time.
>     [...]
>      > @@ -846,21 +828,20 @@ static void qtest_event(void *opaque,
>     QEMUChrEvent event)
>      >           for (i = 0; i < ARRAY_SIZE(irq_levels); i++) {
>      >               irq_levels[i] = 0;
>      >           }
>      > -        qemu_gettimeofday(&start_time);
>      > +
>      > +        g_clear_pointer(&timer, g_timer_destroy);
>      > +        timer = g_timer_new();
>      >           qtest_opened = true;
>      >           if (qtest_log_fp) {
>      > -            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
>      > -                    (long) start_time.tv_sec, (long)
>     start_time.tv_usec);
>      > +            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
>     g_timer_elapsed(timer, NULL));
>      >           }
>      >           break;
> 
>     The new timestamp here is quite unuseful now, of course ... could you
>     replace it with g_get_current_time()  instead?
> 
> 
> Eventually, but I wonder why this (and only this) particular timestamp 
> should be the current time.

I assume it was meant as a possibility to sync the times in this log with 
other things that are going on on the host system in parallel. If you only 
have the relative time stamps in the log here, you cannot compare the events 
to other logs anymore.
(having said that, I wonder why it doesn't simply always use the current 
wall time and uses the relative time instead, but maybe there is also a 
reason for that...)

  Thomas


