Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D46832CD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 17:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMtZe-0002zt-Ri; Tue, 31 Jan 2023 11:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMtZX-0002yy-Oi
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:33:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMtZV-00073R-Pn
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675182803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U+TC5QI5OTrOwXtGIKELgMUbgYxbLGuos47NsCzDRQ4=;
 b=XOunGpwz9SKKuO+uUTxSPwyoPc3hWXvT8OphvEXblfran+082ZGBsFIDKPVYvzE4+0wgRW
 c/a0i6A0XPDdUGmW/dKK+ZATkpY36B1l5TDUUX+oSw+rBM3xIl/owHbz/jqmnoEpLw+fhF
 nwyP5vzrGqXczkkwDxNS57t88dMokuk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-3Ng0IB3AOq6WgKVUgGXBfQ-1; Tue, 31 Jan 2023 11:33:19 -0500
X-MC-Unique: 3Ng0IB3AOq6WgKVUgGXBfQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o24-20020a5d58d8000000b002bfe173775aso1557180wrf.3
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 08:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+TC5QI5OTrOwXtGIKELgMUbgYxbLGuos47NsCzDRQ4=;
 b=fuhjE1+PouAlBODPoxCHsAVqbIOAFJ4IdWMmqPsgxescucgzVgISAiOkzMAovlV+RI
 JqFC6bOYJ6NcTKuonpxIgLhVeO/LyRPKhp75jMZvKL3zsvynjqHTMMkOAVOg9oRyWPJU
 q6rqWtifEopySC+i/pEy+j7lnH30tPNtzsRGSmdoPTZYpsLjWmK9/5x+nA3RhUEID7+s
 pg68XTZ39xht+SkZx/f9VSeyJCyj3kSwoBJUuUYZz3dcyPmusd1yzWMe+yp/xfhyxDlP
 4Amcs+OFLmD4+Aiz6AnC3XtzgFahhYRaCjzmIR5pojdUlNvLS7807Txz5rbonaA6uXP8
 mSIg==
X-Gm-Message-State: AO0yUKWKPvy9HMIPSFJYg6Ei+9HMF8iUR2oFEXb/uCo9K13HvSnI/QGC
 NpjQTZyBy9tf8ydjqeNkfBzIkUahSbV74xBOAoPLbb2/gFtIQMj7O7pHznn+tScxLDV3uAACLpU
 NcVi1kvujcgeiUvg=
X-Received: by 2002:a5d:5247:0:b0:2bf:e9dc:5557 with SMTP id
 k7-20020a5d5247000000b002bfe9dc5557mr9273410wrc.26.1675182798221; 
 Tue, 31 Jan 2023 08:33:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/AlQ/t6zUAy5vH0rYh1BbPLNduPo5NbZlzreR2LlZKuHikgezccJkSfTeiiJdvARws9D6ffg==
X-Received: by 2002:a5d:5247:0:b0:2bf:e9dc:5557 with SMTP id
 k7-20020a5d5247000000b002bfe9dc5557mr9273385wrc.26.1675182797893; 
 Tue, 31 Jan 2023 08:33:17 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c248300b003db0ad636d1sm9404447wms.28.2023.01.31.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 08:33:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 2/3] migration: implement query migration threadinfo by
 name
In-Reply-To: <07cad820-0755-2da9-e4d7-4e00f7b3a8f7@huawei.com> (Jiang
 Jiacheng's message of "Tue, 31 Jan 2023 21:00:03 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-3-jiangjiacheng@huawei.com>
 <87o7qgode5.fsf@secure.mitica>
 <9b3fc9df-d273-4008-36c2-c779a40132c2@huawei.com>
 <877cx4p1ai.fsf@secure.mitica>
 <07cad820-0755-2da9-e4d7-4e00f7b3a8f7@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 31 Jan 2023 17:33:16 +0100
Message-ID: <87edray88j.fsf@secure.mitica>
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

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> On 2023/1/30 22:03, Juan Quintela wrote:
>> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>>> On 2023/1/30 12:27, Juan Quintela wrote:

>>>>
>>>> 1st, it is an int enough for all architectures?  I know that for linux
>>>> and friends it is, but not sure about windows and other weird systems.
>>>>
>>>
>>> It is only enough for migration pin which I want to implement. But I
>>> think this struct can be easily expand if we need other information
>>> about migration thread.
>> 
>> I mean that pthread_t (what you are passing here) is an int on linux.
>> Not sure on other OS's.
>> 
>
> I'm sorry about my misunderstanding. I use 'int' for thread-id just like
> cpu or iothread's thread-id, and it is get from 'qemu_get_thread_id'. So
> I think it is enough.

Ok, fine enough.  Thanks.

Later, Juan.


