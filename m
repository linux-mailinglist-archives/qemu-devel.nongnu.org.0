Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A356F7139
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpT-00019H-S8; Thu, 04 May 2023 13:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubnc-0000gq-Pf
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubnX-00084Y-B6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683217634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8XIguG2hKvEJCpZ/L+/ueU/o4xNdCnpue1DMR7HAtI=;
 b=FaSLr5XXSY7DBS1UdzUNB3TX9AeuwbBL0zDe3poAXd+DFBnTFcviRK20ZMW3KmQlKCYojS
 LvSnOmPtHi/bM9Mf3stRryzjjmQEBl1LWDE8uDeT/w/oCGWRp85a+PhSqMQwr7jbATjKDQ
 wy6ysJPh20VHfNg57VUdqZECglkIQeM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-zE55btZZPxmm9EXd18SwVw-1; Thu, 04 May 2023 12:27:12 -0400
X-MC-Unique: zE55btZZPxmm9EXd18SwVw-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5287c9b01fdso480604a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 09:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683217631; x=1685809631;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z8XIguG2hKvEJCpZ/L+/ueU/o4xNdCnpue1DMR7HAtI=;
 b=fvoJiHNtIVuDY5/Z009yq7BbbQSUZJGRDiBUAshtWZOQT4T+m/LREUJNdvBY30n2Y6
 M41KCCiMgWZa2Y63IlmBfzXMMCvl5Ss5xwnjNnJxjkq4p7y/dZhCR8qBHeg3WTTn//GK
 FJdSp+C6/Rp7LSwSYZWI7Yj0jAcRotMTptB7LAtTU9qj7oKYnTt3Bf74N+ryk71K2y/a
 Gb7ggZxSojyDTzqJy7FojKtw5aP/uT8tkqy3m/HRNB1ccMZUKiB8kyEwF+/2BbLhi173
 7agbwaGl5RGKIPa0gVnqjn+rMCDR3ZDR8cdU1LTQixVwxniuUOm3Vw6iCvoc42KPTGrb
 q+ww==
X-Gm-Message-State: AC+VfDwTv5V0/c736P8NbmWHqxS7GgWmNpBt0DQ7uSQX2VvIaJybWhsy
 GeipTgoGroOznvyGhfkgQDY5+VthxO9JG5wSEDFJXu2kW7E/iXSnUPab8F3Fp4Sw3v5nU8Ahmcr
 uHXpz1ox6D4H5+i6gTMP2+xii7FWFRCRKP+oBwSoPjyQtsiewG/S1nxr7OCrBP9Cgj33/Q24nXG
 A=
X-Received: by 2002:a05:6a20:7f8f:b0:f3:1c8b:ce54 with SMTP id
 d15-20020a056a207f8f00b000f31c8bce54mr3551896pzj.4.1683217631267; 
 Thu, 04 May 2023 09:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wahqz8g8vPL53W8P95BLu6P1Ay94vl9gWA69hGTDPSTkahy+qT+Ja8Vghs9aAFtvoyaKFAw==
X-Received: by 2002:a05:6a20:7f8f:b0:f3:1c8b:ce54 with SMTP id
 d15-20020a056a207f8f00b000f31c8bce54mr3551871pzj.4.1683217630855; 
 Thu, 04 May 2023 09:27:10 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 c188-20020a621cc5000000b0063932e36437sm3460154pfc.134.2023.05.04.09.27.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 09:27:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v2 0/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230504154611.85854-1-anisinha@redhat.com>
Date: Thu, 4 May 2023 21:57:04 +0530
Cc: "Michael S. Tsirkin" <mst@redhat.com>, berrange@redhat.com,
 alex.bennee@linaro.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 wainersm@redhat.com, bleal@redhat.com, thuth@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6BE124EC-1E4E-4711-B23E-9AA4B15EE992@redhat.com>
References: <20230504154611.85854-1-anisinha@redhat.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



> On 04-May-2023, at 9:16 PM, Ani Sinha <anisinha@redhat.com> wrote:
>=20
> mformat and xorriso tools are needed by biosbits avocado tests. This =
patchset
> adds those two tools in the docker container images.
> xorriso package conflicts with genisoimage package on some =
distributions.
> Therefore, it is not possible to have both the packages at the same =
time
> in the container image uniformly for all distribution flavors. =
Further,
> on some distributions like RHEL, both xorriso and genisoimage
> packages provide /usr/bin/genisoimage and on some other distributions =
like
> Fedora, only genisoimage package provides the same utility.
> Therefore, this change removes the dependency on geninsoimage for =
building
> container images altogether keeping only xorriso package. At the same =
time,
> cdrom-test.c is updated to use and check for existence of only =
xorrisofs.
>=20
> Patch 1 pulls in the latest changes in lcitool in order to add =
mappings
> for these packages in various distros.
> Patch 2 updates all Dockerfiles in QEMU repository to add these two
> tools. It also removed genisoimage package and updated cdrom-test to =
not
> use genisoimage but xorrisofs.
>=20
> CC: mst@redhat.com
> CC: berrange@redhat.com
> CC: alex.bennee@linaro.org
> CC: philmd@linaro.org
> CC: wainersm@redhat.com
> CC: bleal@redhat.com
> CC: thuth@redhat.com
> TO: qemu-devel@nongnu.org
>=20
> Changelog:
> v2: remove genisoimage package and update Dockerfile. Also update =
cdrom-test.c
> so that it uses xorrisofs and not genisoimage. I have tested patch #2 =
on both
> Fedora 37 and RHEL 9.1. cdrom-test passed on both.

Also running this pipeline right now to verify:

https://gitlab.com/anisinha/qemu/-/pipelines/857490765


