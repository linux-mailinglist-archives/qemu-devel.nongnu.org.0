Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B664C6FE202
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:00:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmDx-0008C6-Bk; Wed, 10 May 2023 11:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmDt-0008Bj-Pv
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmDs-0005ZE-6q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734362;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f/pP94hsuAvZteh7+y3eV0KthCazikbrGIVXglgCRxM=;
 b=IKSNGLBMabyFNB1ZaLhyS0ss0cP0WOZtAXs8RsdnXutxmk8FP0k3gomsFkiQZCdz7XnPdj
 ctbbxthSyNbgfB5qjAa1N9cmy6LjO1tQo5DA45uq6/QEYrGIuzz006MW+GAFhkNxJ1jQ8J
 W4o7yLzmO3RmrfMtnXLEDEHZzEBzGU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-FS19y1IRPhWttGH5FJcIcA-1; Wed, 10 May 2023 11:59:21 -0400
X-MC-Unique: FS19y1IRPhWttGH5FJcIcA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f4dd7f13d0so3166645e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734360; x=1686326360;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/pP94hsuAvZteh7+y3eV0KthCazikbrGIVXglgCRxM=;
 b=ME4CM3hLUZiV10sYgKYHl1k8vU9dy0EB19Z1L+za0Hp1eqWzFqQlmMW6MP/pDRsvdW
 XMIgMeR3/cu8dE8fajY5nAW7habkQOqEUJ7dEOxj4EtvE98gw2Dhv6KA2SQY3nK+mvd0
 Smey4NECxEahwDt5gqhoA+op56ZRCAcTiGpz1WFuD7by3CHoO0e1vvkNOVNOYtW+yZcM
 Imh2Zoa+6RWyuINA+XyYH9jSBUvQIpr7Xp3CFQSyu6RHZZDQg4+VhOxrqB9WQKVUX9W0
 fUosSOnKAeKPpKjVF2HeYpJ6HPQua1bYl31PyQxMUXkMDI0AKteQKdmnLHMfUy6vKSiG
 ozKg==
X-Gm-Message-State: AC+VfDyoF8HEoP20u1LryHRiGGcQSiAsf/GDM/yKJvxti09AxfvD2rJ1
 qiWfk1QFCou89j/jEdQ2f8XTuquDZ428YIveCsD2OwFWnueNBgh/nbSWSNa9PeNcfVa7hW/0z9u
 M3c01IWuw9K9jAOM=
X-Received: by 2002:a05:600c:3787:b0:3f4:2bcd:5a6e with SMTP id
 o7-20020a05600c378700b003f42bcd5a6emr4051404wmr.30.1683734359989; 
 Wed, 10 May 2023 08:59:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7WwiVepKnTZsvBuryFT+rdBm5QHHeKrneiDkXYSuEHsd79aJSebLcCNnwmitnq48Kht77cNw==
X-Received: by 2002:a05:600c:3787:b0:3f4:2bcd:5a6e with SMTP id
 o7-20020a05600c378700b003f42bcd5a6emr4051391wmr.30.1683734359714; 
 Wed, 10 May 2023 08:59:19 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003f049a42689sm22880638wmk.25.2023.05.10.08.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:59:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Peter Xu
 <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
In-Reply-To: <e08fcc14-8ce2-e537-c1ba-d0e46faf5687@nvidia.com> (Avihai Horon's
 message of "Wed, 10 May 2023 18:52:20 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-4-avihaih@nvidia.com>
 <87cz38a7n6.fsf@secure.mitica>
 <e08fcc14-8ce2-e537-c1ba-d0e46faf5687@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 17:59:18 +0200
Message-ID: <87wn1g6uuh.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Avihai Horon <avihaih@nvidia.com> wrote:
> On 10/05/2023 11:54, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>

>>> +static bool initial_data_loaded_acked(MigrationState *s)
>>> +{
>>> +    if (!migrate_precopy_initial_data()) {
>>> +        return true;
>>> +    }
>>> +
>>> +    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
>>> +    if (!runstate_is_running()) {
>>> +        return true;
>>> +    }
>> Thinking loud here.
>>
>> What happens if we start a migration.  Guest is running.
>> We enable precopy_initial_data().
>>
>> And then we stop the guest.
>>
>> Are we going to receive data that expect this return false?  Or it is
>> handled somewhere else?
>
> Not sure I fully understand what you mean here, could you elaborate?
>

static bool initial_data_loaded_acked(MigrationState *s)
{
    if (!migrate_precopy_initial_data()) {
        return true;
    }

    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
    if (!runstate_is_running()) {
        return true;
    }

    return s->initial_data_loaded_acked;

    ****** here we are only returning a value. I mis-read we were
           calling a function.  Sorry for the noise.
Later, Juan.


