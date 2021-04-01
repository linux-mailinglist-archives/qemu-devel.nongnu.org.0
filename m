Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E123516B7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:34:25 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0H1-0005PG-U8
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS0FT-0004da-Cf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS0FM-0005T3-4n
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617294756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAG9Qp47lvTSgmYDlgeiRevIm5DHt8RdUSw7vu2GnRY=;
 b=Gx0xjZROXPYW92ghQCLEy4S6TZMq9Dr4XYswKJCYG82e5Psdfqmo0bG0xlrra6IX6q4kmX
 bDy86SlnPT62L3X5ESTEHJhMbeoolsxsCOs0U5j8Z/UxMc7Q3L7ROAYcw1gpO3WRZQotej
 CAflTIgd2Gq72Sh0RoUF4B0GTx5rLXY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-wGPn-qypP5KWId427ZXUPA-1; Thu, 01 Apr 2021 12:32:34 -0400
X-MC-Unique: wGPn-qypP5KWId427ZXUPA-1
Received: by mail-wr1-f69.google.com with SMTP id o11so3013237wrc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bAG9Qp47lvTSgmYDlgeiRevIm5DHt8RdUSw7vu2GnRY=;
 b=WaJ34MPhaEoGCeb6gRmcfSqEnGej9Sp7VTcNADeN/WCkqcR7O5d0O8WnMaQyzV/p2l
 cylc0r7EaSjvoult7vBxhsLXc7vpQCisxj3WNP/N88sJLfsf40vZOpYOXGeCgwbm4GCi
 Y5qz7vE30vcVNebJkflN31Pk07cun2eR35GOLW5g5rhOpN3ATJwm6dWIwR65ClJ5aLpV
 BJUB62OSzUlSuSY6W845gOorrRMixl9GEEP/6udRSzcJbWNpTuLvwo4d++uB0kO2aWpH
 8fcBJSPApR2AYMpgnhsAPX1JrSDbTLDNKWQ/7xQfEaY2HSu5X3ZDmVoHxPg/fTJZYY9+
 mz4A==
X-Gm-Message-State: AOAM530rYTs5PmpTlsJa/e04XXF0cJk6yxLl7h3MojLwdmWMcKHwPvoQ
 u9CTvXDk0/g4RsFDwkeFGBy96VhiB3eFtiXLwsvhBtzHRRa5j+Fkv5UupYxNaZIjC+z3i8pBYYT
 7b9l/CVqtZQhTi8s=
X-Received: by 2002:a5d:5906:: with SMTP id v6mr10782135wrd.137.1617294753268; 
 Thu, 01 Apr 2021 09:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxatG3ihfMSK4unojZ6VUIN1WN+NC/7Q+itipOGWbup1HYIBG2HDNtY5KHZI6ZkNvCOoYO3Ow==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr10782101wrd.137.1617294753062; 
 Thu, 01 Apr 2021 09:32:33 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id n3sm8871240wmi.7.2021.04.01.09.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:32:31 -0700 (PDT)
Date: Thu, 1 Apr 2021 12:32:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
Message-ID: <20210401123148-mutt-send-email-mst@kernel.org>
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
 <20210401095725-mutt-send-email-mst@kernel.org>
 <m3k0pmjd1x.fsf@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <m3k0pmjd1x.fsf@bernat.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 04:26:50PM +0200, Vincent Bernat wrote:
>  ❦  1 avril 2021 09:59 -04, Michael S. Tsirkin:
> 
> >> +                /*
> >> +                 * TODO: Extract the appropriate value. Most of the
> >> +                 * time, this will be 0.
> >> +                 */
> >> +                t->segment_group_number = cpu_to_le16(0);
> >> +                t->bus_number = pci_dev_bus_num(pdev);
> >> +                t->device_number = pdev->devfn;
> >
> > Problem is, for devices behind bridges for example, bus is only
> > configured by guest, after pci has been enumerated.
> >
> > So I suspect this either
> > - needs to be limited to only work for the root bus
> > - needs to be re-evaluted on guest access, like we do
> >   with ACPI
> 
> Or the address can be provided by the user. I didn't want to keep that
> at this is error prone and there may be surprises after adding a device
> or after a QEMU upgrade.

Or on guest changes.

> 
> Otherwise, limiting to the root bus seems a fine limitation by me. How
> do I check that?

pci_bus_is_root will do this. Pls document the reason for the
limitation.


> -- 
> Don't just echo the code with comments - make every comment count.
>             - The Elements of Programming Style (Kernighan & Plauger)


