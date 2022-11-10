Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DD0624DC8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:48:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otGKa-0002VA-84; Thu, 10 Nov 2022 17:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1otGKX-0002Ux-7t
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1otGKV-00055G-1U
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668120445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pV2f+mPpba14WEkcsF9LPPn29NIsQQDosPlmziUAi+E=;
 b=ZRbmPVBWjcLbmYX/ErhH4C+MybxBBDojkbbrVdmbWyYS1bjE6Mx7HHsdbolleP7X6whnC/
 7b/16NQaiAk947LItGD6mqmbe5YGLD16vfFG418cnNfd/meQvq9FeONdh97EEtZBL5Yozy
 YxMBRIlF73rbaUzNsicNu6Zs5MX4l7U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-I-y3PCg2PFehS1dok2u_Uw-1; Thu, 10 Nov 2022 17:47:24 -0500
X-MC-Unique: I-y3PCg2PFehS1dok2u_Uw-1
Received: by mail-qv1-f69.google.com with SMTP id
 nn2-20020a056214358200b004bb7bc3dfdcso2562493qvb.23
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 14:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pV2f+mPpba14WEkcsF9LPPn29NIsQQDosPlmziUAi+E=;
 b=G4sSQK/9xsXE2qQB2NMDxzS/caCuVflDz9b3Kh9WzpEl+4t2GW5qGSlRfZcEJaopjg
 7TwhTdBsNF7sTlrpauXgFf3sz+SwIK5hqOhtktT+TUD8TTVzgHko4xtYpcP79J1IU5RM
 aWKxhlpkuUu/lRskySahBIU6fvn9G80n7iRY/3iXfQeW41YfZXLjpSQw1bQEib3EEKO8
 clgLGeJ1EhscOcI+pJDYeM+AwfD+zw8Whfn9c5ebL4MmFQ/Lry0Bw3hDA/24XhxYs1AU
 gzE7PcXoya4f22vU5n0nw7Y4V7LYFB9BbrbAPaay/qy4/MOQqec7hye1c8qbA/VFpgLC
 DlrA==
X-Gm-Message-State: ACrzQf0pYLbSVrgqWuVAgrVjaYwhZpYXpRNA5m5w2NFS6qQSr6UiNzrv
 8E8S8sd0RolJb0WoAYDtq9UVIJsDNAT5vZT6xrTlSo9pcRiejg1SiEV9q1ff6iC8DXhjAzrw/v7
 iOABRGFA5mwqme+k=
X-Received: by 2002:a37:54c1:0:b0:6f4:fe28:a69f with SMTP id
 i184-20020a3754c1000000b006f4fe28a69fmr2142141qkb.21.1668120444238; 
 Thu, 10 Nov 2022 14:47:24 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5g5faXWrBcgAjtGxILVtCSCSePhhGOdW7WdncbCO+k3oUReCXrD1CUjw7qiRrJTa8BhwbP/g==
X-Received: by 2002:a37:54c1:0:b0:6f4:fe28:a69f with SMTP id
 i184-20020a3754c1000000b006f4fe28a69fmr2142129qkb.21.1668120444041; 
 Thu, 10 Nov 2022 14:47:24 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 x12-20020ac8730c000000b003a57f822157sm265841qto.90.2022.11.10.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 14:47:23 -0800 (PST)
Date: Thu, 10 Nov 2022 17:47:22 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
Message-ID: <Y21/elPaaiWVNTSI@x1n>
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <52579466-e91f-2bea-b39e-b48cc3cb8a24@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52579466-e91f-2bea-b39e-b48cc3cb8a24@nutanix.com>
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

On Thu, Nov 10, 2022 at 05:59:45PM +0530, manish.mishra wrote:
> Hi Everyone, Just a gentle reminder for review. :)

Hi, Manish,

I've got a slightly busy week, sorry!  If Daniel and Juan won't have time
to look at it I'll have a closer look at it next Monday (holiday tomorrow).

-- 
Peter Xu


