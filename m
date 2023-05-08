Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEB6FB585
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 18:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw43i-0006Z9-8J; Mon, 08 May 2023 12:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw43g-0006Yz-40
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw43c-0001ju-7Q
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683564584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLBV4ZGd5IJFAIQTRegpy2fYg211Vxq2tBmnff5AB8I=;
 b=SqlyB1uX7mIZ3b/yWWtfwIPlC2dwiKkHMir/ccq86wwDHS2KailWBLhGcEgYpduYeCAluQ
 78KJ+4d5pjFarKwefnfIB29q97McThOQleEkeRd1nq1IEk+zQB4W/oTRYLIVDfMXWp/Ty6
 Vvc3Yl5kGLD8xFjyX3y1DBrbMlBAWmc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-hMqfUUgHN1ims_VFKtZobg-1; Mon, 08 May 2023 12:49:43 -0400
X-MC-Unique: hMqfUUgHN1ims_VFKtZobg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-965b9e29579so528273766b.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 09:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683564582; x=1686156582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLBV4ZGd5IJFAIQTRegpy2fYg211Vxq2tBmnff5AB8I=;
 b=iBvcxAxijh2sHiKQ3wpSpjDBgis7NxIQlzrahhZIulZKcvKxC4M5O4dX4u6ajvB+72
 ZwoQBSGxVEZRwxfS8F6oY4rcQI9ehW4gSZ4t7UWeDONTZJnqbNOLspXjNc/+Z6hSk3NK
 hKZsRxXAMi5UfLl0rrCif4YqPLaIMz0eN0vrMyEAPLyTeg+Tc++gnBW+K6wUsf132lwc
 gQ0qh7X6vstjoO+bInlND4UUbunJhj/K6HinqmvMRyUKLHfrzgz1o33Uh9fRACisf901
 rhcqW6M5Dm5/+1AqMApBGyKy6ao1IJSzDTuZawBI9Jt0uGge8jlw+8Pyrrm07QsZRQkF
 rXHw==
X-Gm-Message-State: AC+VfDwv9K93fQgiOHD4MzHyoXjF57HhI1zi+jgx7lTb1H5v6ndk9P78
 WfX56SZ+wQ6swRFeOY7EB5HtelQ6y08BplgjZ8v8oGglGEx9E3+8Ltw9g/t91KpVE+F77Pi8cQq
 2fAfLW8Ocuz+FDE8=
X-Received: by 2002:a17:907:6da3:b0:969:9118:a991 with SMTP id
 sb35-20020a1709076da300b009699118a991mr1090309ejc.42.1683564581966; 
 Mon, 08 May 2023 09:49:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7n5ah3bKigUJ035Ldd+bOd0yotngd0veopDPHNtLXJPEaIZ4uSghdWVj5Xe9ua31zIqnNrXw==
X-Received: by 2002:a17:907:6da3:b0:969:9118:a991 with SMTP id
 sb35-20020a1709076da300b009699118a991mr1090291ejc.42.1683564581683; 
 Mon, 08 May 2023 09:49:41 -0700 (PDT)
Received: from [192.168.8.104] (tmo-124-74.customers.d1-online.com.
 [80.187.124.74]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm184281ejb.103.2023.05.08.09.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:49:41 -0700 (PDT)
Message-ID: <11962c60-475a-31a8-ef55-8da6dacca9d2@redhat.com>
Date: Mon, 8 May 2023 18:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC v2 1/1] migration: Update error description whenever
 migration fails
Content-Language: en-US
To: "tejus.gk" <tejus.gk@nutanix.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 berrange@redhat.com, shivam.kumar1@nutanix.com
References: <20230508153223.133081-1-tejus.gk@nutanix.com>
 <20230508153223.133081-2-tejus.gk@nutanix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230508153223.133081-2-tejus.gk@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi!

On 08/05/2023 17.32, tejus.gk wrote:
> There are places in the code where the migration is marked failed with
> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence

s/failiure/failure/

> libvirt doesn't know why the migration failed when it queries for it.
> 
> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>

The Signed-off-by line should contain the proper name...
Is "tejus.gk" really the correct spelling of your name (with only lowercase 
letters and a dot in it)? If not, please update the line, thanks!

  Thomas


