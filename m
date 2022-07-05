Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BDE56645F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:51:20 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dL5-000109-OW
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dIY-00080n-D6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dIT-00059C-42
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657007316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmnSqZGMQ7ePBwF+Yhnsi85huIiL04UXQJiiFKOzteU=;
 b=gXZogYRML1EPq8aNX40anLKLv77fgT4OExQezqM5JaM1cMw+VxxHRL5+wEXDUtGo8VtZmC
 8JBALp/G2hDSZ2pLzOH2mbJ9Yn6pktkr7GiuakzemcwGgCJtjXQ43o90idU9i3JOC9on61
 wrXN22kqVDDLwgQFrngGdUOd4gezrgM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-SC5rf64MMdiUNamQA0E7Mg-1; Tue, 05 Jul 2022 03:48:35 -0400
X-MC-Unique: SC5rf64MMdiUNamQA0E7Mg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az40-20020a05600c602800b003a048edf007so4936627wmb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 00:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=CmnSqZGMQ7ePBwF+Yhnsi85huIiL04UXQJiiFKOzteU=;
 b=bo8/usogJplVEPbOkMBnc9CLIXe+HAXtM7MI0nFbL1EQPE/Djx1PV9SxRM1XjF/vz7
 y9vBgeObBvVi1mCR4lx61CRKyL+W1FtuFjWZUOMtavtXubdeDMf9VE4pvhC7EKerm+EG
 lGheRFna4oheOZgIGa5JGqfed8u1XupuR4On3TKSqGg00JmVPjoOP7/aXH4+Niymzhgp
 WXni4t7jNYFtj3N9wI63YHSzvyTThqdCpVJGc5701LcRvEtbWn+JQXh0ma4RQ9i0cSUQ
 tTJ4lOHozNB7Pl7IXp7aw3fEAsKAKypLEgjK2n0pfPIz3CQE3aehL2I9okkiiHJR6qiv
 UxKg==
X-Gm-Message-State: AJIora9j79vyWbzROrkrG3XsPhb3R+qqgDt0UkaWtl/6jhNKzIMx5ClU
 TJcPKQ9ZvgGSz0NlWXax0h9ZqMU01oNvskdkZpqwPOxcfuxrNTdLrbdXsSgSurLItWricyHi5bS
 KSuXHeX4htAXjkFo=
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr31229869wrq.406.1657007313953; 
 Tue, 05 Jul 2022 00:48:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1UdN9CLkgOW6uGT3aXSg39q/yyrCJbTPXO9r5F7dEz3O8GAF2a+fROKQ+U7+CC/SOtDrVjg==
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr31229850wrq.406.1657007313750; 
 Tue, 05 Jul 2022 00:48:33 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 r15-20020a0560001b8f00b0021d74906683sm786139wru.28.2022.07.05.00.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 00:48:33 -0700 (PDT)
Message-ID: <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com>
Date: Tue, 5 Jul 2022 09:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
Content-Language: en-US
To: "Zhao, Shirley" <shirley.zhao@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
Cc: virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 03.02, Zhao, Shirley wrote:
> Hi, all,
> 
> I want to use virtiofs to share folder between host and guest.
> 
>  From the guide, it must set the NUMA node. 
> https://virtio-fs.gitlab.io/howto-qemu.html 
> 
> But my guest doesn’t support NUMA.
> 
> Is there any guide to use qemu + virtiofs without NUMA?
> 
> Or does qemu have any plan to support it?

  Hi!

At least on s390x, you can also specify the memory backend via the -machine 
option instead of using the -numa option, e.g.:

  qemu-system-s390x -machine memory-backend=mem \
   -object memory-backend-file,id=mem,...

Not sure whether that works on other architectures, too, though. Stefan, 
David, do you know?

  Thomas


