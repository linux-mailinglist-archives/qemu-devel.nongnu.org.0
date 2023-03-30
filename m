Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911976D10FC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 23:43:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi01l-0006ng-23; Thu, 30 Mar 2023 17:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pi01i-0006nN-4d
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 17:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pi01g-0002Tr-6M
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 17:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680212503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nm79tewlwy26/irK5q3YYSMEjgEYSypg3xfENfNqUGk=;
 b=fcikxhrIn0PPcRp9BWZPPvTH5gEzgPOl51Au8Xv2sK+FHwL3te1lPQAvGT18pZdriTU+7M
 uffi8HJ3EXc7rl2IJNvfUYY8w9WUMQZ+hlj6clCxbx/x46ZqNhuoBu5U6Q6BnFxCuYlmDt
 ewqURsNTfkg8VbvY/3906blXT20pmtk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-nEj5W4CLN3uLKexc89jVrQ-1; Thu, 30 Mar 2023 17:41:41 -0400
X-MC-Unique: nEj5W4CLN3uLKexc89jVrQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 v10-20020a05622a130a00b003e4ee70e001so7311949qtk.6
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 14:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680212501; x=1682804501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nm79tewlwy26/irK5q3YYSMEjgEYSypg3xfENfNqUGk=;
 b=hZ1rcYyryBg9pSWljQsSzY9if2mJ13ocsWwFFUyHEhS9niSw7wfFbR405yplLBKMKR
 1+KukRecASQZFgzDwXaX0KMANB23MdQr2N0LgFYh/GKE8veX0tniJMfRLw8M8oC+cJOj
 WQolPNcHK6Fz8qoNTMp3T87DZ6FtyDqamACfs/3c8KKl3/nPuvOI7KRkGhmITO7KofAn
 ttNTGHGfN50r3IxmH7cmr2WrpEbRM+ZHv0ZiKWEZ2GqHxiJE8XJ57NgXRJFU0rOwt56c
 /QQPxLVuuk8yVznPRe4MyHCWkFQaupSDrKT55LgfGytbPZJJgvSNso6Ye2VijI84u2ya
 cKZg==
X-Gm-Message-State: AAQBX9cPV4R6HvEbebKbyyPdw/iWXj2NagiR8UQfh3y6VR2oTtEIfeXv
 mr94tX1Sc+FrFtqKHfx+rTh6GcgwNz57mysAoSNThJ5EU/CANd1d9R+yJP3iZN/1sORG+wE0yMv
 hpxUXBqYdmOYLpjY=
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr38616017qvb.2.1680212501460; 
 Thu, 30 Mar 2023 14:41:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350YiExSRepI3gqnQ6Fu5Xs8tyg5LldGOTCZ5/QiyfNK61h9VG5NmdDA8i8n762J+HVrv3UbMtg==
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr38615993qvb.2.1680212501137; 
 Thu, 30 Mar 2023 14:41:41 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05621411a700b005dd8b9345ccsm123805qvv.100.2023.03.30.14.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:41:40 -0700 (PDT)
Date: Thu, 30 Mar 2023 17:41:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCYCE0llX9WANK18@x1n>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
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

On Thu, Mar 30, 2023 at 03:03:10PM -0300, Fabiano Rosas wrote:
> Hi folks,

Hi,

> 
> I'm continuing the work done last year to add a new format of
> migration stream that can be used to migrate large guests to a single
> file in a performant way.
> 
> This is an early RFC with the previous code + my additions to support
> multifd and direct IO. Let me know what you think!
> 
> Here are the reference links for previous discussions:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html
> 
> The series has 4 main parts:
> 
> 1) File migration: A new "file:" migration URI. So "file:mig" does the
>    same as "exec:cat > mig". Patches 1-4 implement this;
> 
> 2) Fixed-ram format: A new format for the migration stream. Puts guest
>    pages at their relative offsets in the migration file. This saves
>    space on the worst case of RAM utilization because every page has a
>    fixed offset in the migration file and (potentially) saves us time
>    because we could write pages independently in parallel. It also
>    gives alignment guarantees so we could use O_DIRECT. Patches 5-13
>    implement this;
> 
> With patches 1-13 these two^ can be used with:
> 
> (qemu) migrate_set_capability fixed-ram on
> (qemu) migrate[_incoming] file:mig

Have you considered enabling the new fixed-ram format with postcopy when
loading?

Due to the linear offseting of pages, I think it can achieve super fast vm
loads due to O(1) lookup of pages and local page fault resolutions.

> 
> --> new in this series:
> 
> 3) MultiFD support: This is about making use of the parallelism
>    allowed by the new format. We just need the threading and page
>    queuing infrastructure that is already in place for
>    multifd. Patches 14-24 implement this;
> 
> (qemu) migrate_set_capability fixed-ram on
> (qemu) migrate_set_capability multifd on
> (qemu) migrate_set_parameter multifd-channels 4
> (qemu) migrate_set_parameter max-bandwith 0
> (qemu) migrate[_incoming] file:mig
> 
> 4) Add a new "direct_io" parameter and enable O_DIRECT for the
>    properly aligned segments of the migration (mostly ram). Patch 25.
> 
> (qemu) migrate_set_parameter direct-io on
> 
> Thanks! Some data below:
> =====
> 
> Outgoing migration to file. NVMe disk. XFS filesystem.
> 
> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
>   10m -v`:
> 
> migration type  | MB/s | pages/s |  ms
> ----------------+------+---------+------
> savevm io_uring |  434 |  102294 | 71473

So I assume this is the non-live migration scenario.  Could you explain
what does io_uring mean here?

> file:           | 3017 |  855862 | 10301
> fixed-ram       | 1982 |  330686 | 15637
> ----------------+------+---------+------
> fixed-ram + multifd + O_DIRECT
>          2 ch.  | 5565 | 1500882 |  5576
>          4 ch.  | 5735 | 1991549 |  5412
>          8 ch.  | 5650 | 1769650 |  5489
>         16 ch.  | 6071 | 1832407 |  5114
>         32 ch.  | 6147 | 1809588 |  5050
>         64 ch.  | 6344 | 1841728 |  4895
>        128 ch.  | 6120 | 1915669 |  5085
> ----------------+------+---------+------

Thanks,

-- 
Peter Xu


