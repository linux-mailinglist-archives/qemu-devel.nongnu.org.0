Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6C42D915
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:12:41 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazbE-0004Lv-AB
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mazU6-0002a3-9p
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mazU4-00088m-HL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634213115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7adHu5mU1iejOdd1KrGL6D8FPc23pVKqWaVqqoNsVa0=;
 b=YOdxyOribX60nSVmpaygD0e5pCgwpxGj45P5etMMjd5qE3E9hOvX63s4583VSV5p/qni9D
 cdxrUiUtpJ9q1yxvCv1h8ECArR5wWH7w4LSmSGeCYhkKWAedZqBci0AsGIocyn+KrDmVLD
 KBK/TA5ZlWkO5DarIsD0enzz/Uvps4Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-I31aN2GcO-S_jnBsMUyeWg-1; Thu, 14 Oct 2021 08:05:14 -0400
X-MC-Unique: I31aN2GcO-S_jnBsMUyeWg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so4356778wrv.19
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7adHu5mU1iejOdd1KrGL6D8FPc23pVKqWaVqqoNsVa0=;
 b=GwWgUiHX7tsYuZnn9QTg2o22K2pHLHvvdr/Wo3YiX0Tb1TvGMxhhbiGPgPi7y9i5nk
 WtpCHQyb5y2WODaAZHq5IvCuOhl9moL5jIWqVMVpYCSlnY1FaQqiV0iBR3UmFu5ZsYl4
 XJA4Z0oO6cSYnLVtaWn3yd1Mfw7/SBBvJfJ5ZJDtRbc5QICxUAI9jD+b0091EYYRTriO
 1tXucXmXez08MOinhXg1AuS0Cdi9FhZUjKJV13HIYWf0JZPio35Rj/ZBGaQ2rXGC6vQR
 xqROKFetpSaDVdjQ3ChfLdMIxg1U78bKyLRN+KHOPr/uey4zPBA5r5jhQnbaPylQVCDx
 JcEA==
X-Gm-Message-State: AOAM533gCVJMF3jRQ4yH/q/MrkFZQ98lNjEuvYD4mX+KPyh040OprvHz
 wMkx41vL6ICCDflgbMBqgvqMfcKhycw/A7aCYCThoL6La3yV1Odq+DDMImCBCsbY0nWPfhnH3Nb
 Pm5tPNWi3BW+QVhg=
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr6185424wrs.80.1634213113309; 
 Thu, 14 Oct 2021 05:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRsR6gvYDofPeqWed1RQT6ekA7iIARUUiS7erRzyJ+jY023RB1XCMhvy5BJNzsPmZ6a6pPJQ==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr6185365wrs.80.1634213112973; 
 Thu, 14 Oct 2021 05:05:12 -0700 (PDT)
Received: from redhat.com ([2.55.16.227])
 by smtp.gmail.com with ESMTPSA id y5sm2134733wrq.85.2021.10.14.05.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:05:12 -0700 (PDT)
Date: Thu, 14 Oct 2021 08:05:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
Message-ID: <20211014080436-mutt-send-email-mst@kernel.org>
References: <20211014115643.756977-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 jean-philippe@linaro.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 01:56:40PM +0200, Eric Auger wrote:
> This series upgrades the ACPI IORT table up to the E.b
> specification revision. One of the goal of this upgrade
> is to allow the addition of RMR nodes along with the SMMUv3.
> 
> The latest IORT specification (ARM DEN 0049E.b) can be found at
> IO Remapping Table - Platform Design Document
> https://developer.arm.com/documentation/den0049/latest/
> 
> This series can be found at
> https://github.com/eauger/qemu.git
> branch: iort_Eb_v3

ACPI things look good

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

ARM only so ARM tree?

> History:
> v2 -> v3:
> - comment on IORT node ID (Igor)
> - single mapping disabled comment
> - Added Jean and Igor's R-b
> - added diff to patvch 3/3
> 
> v1 -> v2:
> - fix Revision value in ITS and SMMUv3 nodes (Phil)
> - Increment an identifier (Phil)
> 
> Eric Auger (3):
>   tests/acpi: Get prepared for IORT E.b revision upgrade
>   hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
>   tests/acpi: Generate reference blob for IORT rev E.b
> 
>  hw/arm/virt-acpi-build.c          |  48 ++++++++++++++++++------------
>  tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
>  5 files changed, 29 insertions(+), 19 deletions(-)
> 
> -- 
> 2.26.3


