Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864A698538
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:07:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO33-0003uN-Vf; Wed, 15 Feb 2023 15:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSO2z-0003lc-GF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSO2y-0006eE-0l
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBK4/QZQqttCRSeKFVof9Do5GI2z0eqqWJefUNs4TsM=;
 b=SLv1N/CTMWjIhfuzBFNrjIAi9YpKB9+z8NS+UBTmH9x6xu48c7WfTDEFXtsFAjgSeAHbv2
 OTiF96RW9LnNqpb3zBPyAu2U540/dreHgBQqrQt68Cf8R0+TuH3lj3/aKKBeBjCMO9esT0
 3vmKwEI2YCFbfXNXr649DzxDaxHczhg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-_06y4N9hMji-mc9gXoKX3g-1; Wed, 15 Feb 2023 15:06:21 -0500
X-MC-Unique: _06y4N9hMji-mc9gXoKX3g-1
Received: by mail-il1-f200.google.com with SMTP id
 q3-20020a056e02096300b003157134a9fbso41566ilt.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBK4/QZQqttCRSeKFVof9Do5GI2z0eqqWJefUNs4TsM=;
 b=Q7Ez7TsbMoN7GKRXtbgrlDd3dQmeVwY+jpMgDe70LtLgBNxdArJ2oCJ9XdJ9VH3rZV
 pJzmjiw/KNS+hCxz6btrF6uZzql/uBRjiaZpNGc9JQX5tUp8pTirGg+9lgpATawJksRl
 AeITlgDNbtY13EquyBTPbKBXX7pYHteidM1ItAj9bgfUIgXPo1/cZNFWRqe7a7N0t6C1
 jCpEwdpdCA0BeKTY9PXwXF7k24Hj3xhUKzbbl8c0cqvFfO+P3FJgGQspvdnn9cUmQ0BL
 f0qlbNr5rdwyLIs2R66m9FdjBm/rv/jGam0CkP8V8YSimbwjK8Iejk2hnEMukmii5Nyt
 x+cA==
X-Gm-Message-State: AO0yUKXB5Bh0WZZUH4j4VJAqcMjAaJ9ND89P3985e9nuAK4JfyMMQnKG
 kDNvDMoW1vfpY/Ny4vYSMNfFSk4P0FdWRlb87tEgP229//Tl6XjToVA8nDrU7FwrAr5kBPOeHw/
 bmpc3D1Y9tkr9RuY=
X-Received: by 2002:a05:6e02:1d0b:b0:315:29e8:6ef3 with SMTP id
 i11-20020a056e021d0b00b0031529e86ef3mr2918425ila.2.1676491580905; 
 Wed, 15 Feb 2023 12:06:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/m4SyOP30UWiKk3+LbLkLOQd44P+KHtEIS9rCIZYDDkymoiCYta2avGoC2rb4rg3ziK7DtTw==
X-Received: by 2002:a05:6e02:1d0b:b0:315:29e8:6ef3 with SMTP id
 i11-20020a056e021d0b00b0031529e86ef3mr2918407ila.2.1676491580678; 
 Wed, 15 Feb 2023 12:06:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h17-20020a02c731000000b003a971c488cesm6017100jao.173.2023.02.15.12.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:06:20 -0800 (PST)
Date: Wed, 15 Feb 2023 15:06:18 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 2/3] multifd: Protect multifd_send_sync_main() calls
Message-ID: <Y+07OqNDhKgPbsJ0@x1n>
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215180231.7644-3-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 15, 2023 at 07:02:30PM +0100, Juan Quintela wrote:
> We only need to do that on the ram_save_iterate() call on sending and
> on destination when we get a RAM_SAVE_FLAG_EOS.
> 
> In setup() and complete() we need to synch in both new and old cases,
> so don't add a check there.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

[same issue on SoB]

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


