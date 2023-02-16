Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8073699297
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:01:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSc0e-0008U0-Jz; Thu, 16 Feb 2023 06:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSc0c-0008RD-KN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSc0b-0005u8-5d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mJTdbgDV32ghPVZyabPhLWMOdxPLXj2ZUb/pjYa1HXY=;
 b=E5Jihwqu3QpACoSaJEmF65WO09P8MO6krz/XqGRQ8FfvlZpAvJuigoutnCPDrCyy3Xn/MV
 g+E6nLEpFotWEvQd9VMTzky0KiLl7cjpV4w1muwlmMGN62HMkTLKjadjN8MAlVFunVpvs6
 l3WPdqeg9rHN7Iz5e0IHCP1A0z5UjEw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-FKQkQ1cGP-mWYS9z5vbrQw-1; Thu, 16 Feb 2023 06:00:58 -0500
X-MC-Unique: FKQkQ1cGP-mWYS9z5vbrQw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k3-20020a05600c1c8300b003e209b61ebbso681555wms.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJTdbgDV32ghPVZyabPhLWMOdxPLXj2ZUb/pjYa1HXY=;
 b=Q85zcvsy81v2YcB92PjD4X0DgW4I3bWdi3/XcF4wqUzvHp8Dy0v02/dzQUVYsTlIW0
 9cYYMbuaNVU9PLZwlh+yGemksAVNvxw6erAY5jFVjwbVgkNUXSeXfz76eIlP7rLEAevy
 fJT4+NdX4VCl1678vNQHuRf3cqQH4Vk4TLohLDyw2i2J8Eb7EBCI+BWmY+jWpc0DcLF9
 bRBBbLTyL520LF0I/6Tk+Y2i6B8Q+6oW78/O9eksXyMizb+5eZeRQabXAOhS9TfCoquZ
 BLF0ipyM5rodZgC2N7lgGzLBuXz9BJQQRclsnZYNH1wx7sZ9AuvFb+ee0Xk/KZkysGF/
 i/sA==
X-Gm-Message-State: AO0yUKVT8EShmK4G8CbKAC8lPTYA/7SDV7ku4q1uLZ+YvwoFD/ypug8r
 Mjha9aLWZwH5YU1vgDmpLAApMuH4Gru42ClcTPneCEaomdy+ryU3EbHJrgNNJl5VWI2EruHHV3m
 RGC6us+RqHnmG5DM=
X-Received: by 2002:a05:600c:1714:b0:3dd:daac:d99d with SMTP id
 c20-20020a05600c171400b003dddaacd99dmr4152433wmn.36.1676545257293; 
 Thu, 16 Feb 2023 03:00:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/nMnmqNrfcb0lxIqM1SmdfnO1zwP1XVd7qnE2F2UTZp3vtthtYVkP4RrrkWKykYDd0AkG3cA==
X-Received: by 2002:a05:600c:1714:b0:3dd:daac:d99d with SMTP id
 c20-20020a05600c171400b003dddaacd99dmr4152408wmn.36.1676545256964; 
 Thu, 16 Feb 2023 03:00:56 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e21356bddcsm1384626wmj.33.2023.02.16.03.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:00:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 3/3] multifd: Only flush once each full round of memory
In-Reply-To: <Y+07J9aUmywnQCE6@x1n> (Peter Xu's message of "Wed, 15 Feb 2023
 15:05:59 -0500")
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-4-quintela@redhat.com> <Y+07J9aUmywnQCE6@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 12:00:55 +0100
Message-ID: <87cz69kh7c.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Feb 15, 2023 at 07:02:31PM +0100, Juan Quintela wrote:
>> We need to add a new flag to mean to flush at that point.
>> Notice that we still flush at the end of setup and at the end of
>> complete stages.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> One nitpick below.

Thanks.
>> @@ -4169,7 +4190,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
>>              }
>>              decompress_data_with_multi_threads(f, page_buffer, len);
>>              break;
>> -
>> +        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
>> +            multifd_recv_sync_main();
>> +            break;
>>          case RAM_SAVE_FLAG_EOS:
>>              /* normal exit */
>>              if (migrate_multifd_flush_after_each_section()) {
>
> We could have dropped RAM_SAVE_FLAG_MULTIFD_FLUSH and RAM_SAVE_FLAG_EOS for
> now until we support postcopy+multifd.

I don't think so.

We have this curse of biblic proportions called Backwards compatibility.

We need to mark the beggining and end of sections.  That is independent
of multifd.
And for multifd we have to flush all channels at the end of each
iteration through RAM.  We could do that without involving the main
thread, but I don't see the point of doing that.

> Here it's not only about enabling them together, but it's about running
> them in parallel, which I doubt whether it can really be implemented at all
> due to the fundamentally concepts difference between multifd & postcopy.. :(

Later, Juan.


