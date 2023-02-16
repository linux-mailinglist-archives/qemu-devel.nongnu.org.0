Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C24699A69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShN3-00048z-Oh; Thu, 16 Feb 2023 11:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pShMy-00041Z-B1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:44:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pShMw-0000ua-UB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676565866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdBDAs5KAauap7AQOc621uVJu4F+Tng2uhOxQnCMnmA=;
 b=iU2DYlT4ckfnkzjlnMJEn12RJb1gDRdiMTV2H0mHFz/yg53FYhC6RTKeH3v94Ui1TerqmF
 RrdljfHQ7+/AZGkaQw7hWtBfZEbJNCGESjCJ/6yykbznunKK/AxLx5WUFT7e3qGpfhRDzD
 jYUvZqJh+ElOgaSf43ro0fYYKz13HWA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-EGyC2YjsOzS5sV7Kois_jw-1; Thu, 16 Feb 2023 11:44:24 -0500
X-MC-Unique: EGyC2YjsOzS5sV7Kois_jw-1
Received: by mail-il1-f197.google.com with SMTP id
 j6-20020a056e02014600b003155e564964so1600586ilr.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676565864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdBDAs5KAauap7AQOc621uVJu4F+Tng2uhOxQnCMnmA=;
 b=QSWc+nYT3ffG2+0Z73W5tEG8inlOvgkz4gTr3PAvpU6Vv91AfM0+Qj5pU0DLdCncXn
 USEA2XhYdI7BR2D3TBRnNNRpyEusedqhUjxLQ6myEiNY4eDozFv+lMiD99DVulwKe4Kv
 AhlPMoWuq1r/Db4JVF3diwXx+w79KA03qnGowzpiQacX9lAH1yz9lgQtmcHaLWX439c7
 4GjR7f0nVK/xZ22/N8c/nMwS9o+L6WiRjHMl3V/ZenxT+GmTTcceXH5kupUrVekVdJcm
 n1cB6PjIG086twoA/5YLoCf43772ZzZtx2TStBOWC8fWbZsPIjgT7uAHdICodGSaUYJ5
 Snig==
X-Gm-Message-State: AO0yUKW3z+bYxjzq1HzoEl9FrpxrtutF970bXvlQRaZ+UMpsTNqJ8qGo
 2Z6Ttolk002p/qor6dYDvPp40VFLNfAFb3MEJPUtNlaFLgK1IJWM8uAbMiFqWPoZZdL2ZoXSreP
 gY7XjakaofD+EoLY=
X-Received: by 2002:a05:6e02:1a64:b0:314:9f2b:f63b with SMTP id
 w4-20020a056e021a6400b003149f2bf63bmr5596415ilv.2.1676565864102; 
 Thu, 16 Feb 2023 08:44:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+so4AOkTR4kanbUKInQCLr9Kam+Vxeh2YTle30nY6NM+iPyLEPmvURitcqPuTWAW7X7W/x6w==
X-Received: by 2002:a05:6e02:1a64:b0:314:9f2b:f63b with SMTP id
 w4-20020a056e021a6400b003149f2bf63bmr5596389ilv.2.1676565863771; 
 Thu, 16 Feb 2023 08:44:23 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 s9-20020a92cc09000000b003151919e343sm580272ilp.37.2023.02.16.08.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:44:22 -0800 (PST)
Date: Thu, 16 Feb 2023 11:44:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 3/3] multifd: Only flush once each full round of memory
Message-ID: <Y+5dZdrb2HuUW9qr@x1n>
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-4-quintela@redhat.com> <Y+07J9aUmywnQCE6@x1n>
 <87cz69kh7c.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cz69kh7c.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 12:00:55PM +0100, Juan Quintela wrote:
> >> @@ -4169,7 +4190,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
> >>              }
> >>              decompress_data_with_multi_threads(f, page_buffer, len);
> >>              break;
> >> -
> >> +        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
> >> +            multifd_recv_sync_main();
> >> +            break;
> >>          case RAM_SAVE_FLAG_EOS:
> >>              /* normal exit */
> >>              if (migrate_multifd_flush_after_each_section()) {
> >
> > We could have dropped RAM_SAVE_FLAG_MULTIFD_FLUSH and RAM_SAVE_FLAG_EOS for
> > now until we support postcopy+multifd.
> 
> I don't think so.
> 
> We have this curse of biblic proportions called Backwards compatibility.
> 
> We need to mark the beggining and end of sections.  That is independent
> of multifd.
> And for multifd we have to flush all channels at the end of each
> iteration through RAM.  We could do that without involving the main
> thread, but I don't see the point of doing that.

Oops, sorry I didn't mean to drop the flags RAM_SAVE_FLAG_EOS itself, but
the calls to multifd_recv_sync_main().

RAM_SAVE_FLAG_MULTIFD_FLUSH as a whole can be dropped.

Thanks,

-- 
Peter Xu


