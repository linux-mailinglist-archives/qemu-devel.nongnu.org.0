Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBA44D6EA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:58:24 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9ep-00021t-DR
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml9d3-0000tC-PQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml9d0-0002wo-SZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636635388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiWvmSm9jvfA72OS6xHaQBWLWSUGt6iuLmVD2SPlW5E=;
 b=YTn47ZTtXmtKvvdXlHEg6SKN7IvSAYtN8bk1OZEKsxFUYBcwErrC8zB8+64XHD7KdOEAdC
 iAFXMoRUSySzBLP8lRbu1EJD3Xx6cSVAxkAK6n2BCbJIUnTOZKIy/YheEr47elOzipROTE
 5FqdENuWyvTQdhARwolM4QXF7LSqyZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-ZKQoa2GpPL2huujKyhRw5Q-1; Thu, 11 Nov 2021 07:56:26 -0500
X-MC-Unique: ZKQoa2GpPL2huujKyhRw5Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so991615wrc.22
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 04:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AiWvmSm9jvfA72OS6xHaQBWLWSUGt6iuLmVD2SPlW5E=;
 b=4fpODrUkmFUBZhi6rUe1pSVHnCAYncPZCrtxP16eLBYaSKmhwuZ7x2NyGe9Gxczc/u
 uX2se9V4Yc69gi2Qz04HblIBETH8YQzFTEmK45X/ijBqDm397QeSXkmaIj5e0IkFkLc9
 ERlUlG3d3QqrUh/2GG3xH4zgDnGXjDCTWs4NCkNqutPX9bKISfEvtLQiB1/8YZxOiSnd
 fAJZmjaj807j9ahbt1kuH/nQ4EN9PYNgVvnof3jPCiRpLCjSzDeree8eZN2PhwHpNtpo
 zKHHNlMbnYqROxXXlWqo+yJcXwtT5TpCcj4bnMTLyGWlvDFBLFl8N2AfyiBkCx1JyBBb
 +bfg==
X-Gm-Message-State: AOAM5339qPSSpVD/UxNhICQBybm4uz3AspO5panzuQhZ5mOuRyf5xmpP
 d8FdaVnbqUTSXvfM0BO9aguFCd3MoMVIGglKt+WE/kLIyQK4xTcPZR80lsigg2iISO5ZBgjLqWi
 I9lUnI8TqqnNAQyI=
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr7839012wmq.180.1636635385403; 
 Thu, 11 Nov 2021 04:56:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnbPIyem28KGuWIS+D0I4n6Vo5eLkrfutNvSlcldc0FwCIrboJZvh4oFFCwn7G68bBsmWruA==
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr7838996wmq.180.1636635385272; 
 Thu, 11 Nov 2021 04:56:25 -0800 (PST)
Received: from gator.home (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id f15sm3456104wmg.30.2021.11.11.04.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 04:56:24 -0800 (PST)
Date: Thu, 11 Nov 2021 13:56:22 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
Message-ID: <20211111125622.32ehb747dzfppmwh@gator.home>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 11:03:48AM +0100, Philippe Mathieu-Daudé wrote:
> If the MachineClass::name pointer is not explicitly set, it is NULL.
> Per the C standard, passing a NULL pointer to printf "%s" format is
> undefined. Some implementations display it as 'NULL', other as 'null'.
> Since we are comparing the formatted output, we need a stable value.
> The easiest is to explicit a machine name string.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Yanan Wang <wangyanan55@huawei.com>

Reviewed-by: Andrew Jones <drjones@redhat.com>


