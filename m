Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829D6F6587
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:11:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puT6i-000253-94; Thu, 04 May 2023 03:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puT6e-000236-9N
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puT6b-0004Z5-JK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0tt9EgqFoCDfHlGdXe1yUPSQ/oIxVYM3OqpF/KUIfo=;
 b=HZJX6A1N0E09tiaC2tf4HFpGEZFn1aoMKtvV/Lo6QEhLpgQ+dHy6m4VfcopLsWDMZvwF7c
 25ngV6/sx5D1pflHgbT1pmMw3FPIKI1YpmSkaBWFyyHOUQw2AYhVHwFrFdZmKH3xJ7zWXx
 mHBU9PjmnEW2nvLoi4eDShwnqSrzruE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-abf3cW2BPp-_6abcUnsEZg-1; Thu, 04 May 2023 03:10:19 -0400
X-MC-Unique: abf3cW2BPp-_6abcUnsEZg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-64115ef7234so6968821b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184217; x=1685776217;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0tt9EgqFoCDfHlGdXe1yUPSQ/oIxVYM3OqpF/KUIfo=;
 b=bnNbEUrXfBYRdY6TzNm4PDfxxzY3GayO6H9Xz2SPmPelBojWv/fC7Q7wKDpVzGQfeP
 KxvG6xLG7U5h8eQ7F+Ao1Bt4+H7RmLEMSZ8koVka851kXUldtBt0I7Qyd+14U4GZ9gLn
 9r2MWT9MWngj+slTyCStHQnPL0r/PFXQgVKUS1QO6ui/g4mu2H7dfLn8LUZE8eQZITpL
 FBQru4suKOxV9P1k2lLRGxAwYV+NZwLLaajN8CMhIGhnPVCGxleYz56quZwNX7qoHW4w
 5KTk39+08Rsq7M9gFKT1N1QHCYuXe948Ftsss1AAKNJWx38YM7tYsEBdXvUYfpUv2md1
 a6+g==
X-Gm-Message-State: AC+VfDwZ/2x8+G7ZQwhYnX9sgj7Pbrn0mtOc9AMcSZGjtl3SlYGE/CHP
 8o2UAHY5YinM5qQA/7JKb/AU7wazXj4IKkx7k7S/As3/RBSrhExajabRCVshfNexXBNRUawQ3wB
 WS6xIFPLn+eW/ro5FjKc+ZoE=
X-Received: by 2002:a05:6a20:918f:b0:f3:c08:ce12 with SMTP id
 v15-20020a056a20918f00b000f30c08ce12mr1760046pzd.5.1683184217733; 
 Thu, 04 May 2023 00:10:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5r5pxNYtCx7RKQ473qeQ2/joIMiRASkSuS0Vbiq19HMDjXr7szSERaTAZ6liLG6UAkgZTEaQ==
X-Received: by 2002:a05:6a20:918f:b0:f3:c08:ce12 with SMTP id
 v15-20020a056a20918f00b000f30c08ce12mr1760024pzd.5.1683184217448; 
 Thu, 04 May 2023 00:10:17 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 x125-20020a636383000000b00513ec871c01sm21079935pgb.16.2023.05.04.00.10.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 00:10:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
Date: Thu, 4 May 2023 12:40:12 +0530
Cc: alex.bennee@linaro.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, berrange@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On 04-May-2023, at 12:05 PM, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 03/05/2023 16.55, Ani Sinha wrote:
>> mformat and xorriso tools are needed by biosbits avocado tests. This =
patchset
>> adds those two tools in the docker container images.
>=20
> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and the containers already have that tool installed. Could you =
maybe switch the biosbits test to use that tool? Or the other way round? =
... at least having two tools to create ISO images in our containers =
sounds IMHO excessive.

The dependency comes from the use of grub-mkrescue in the avocado test =
in order to generate the iso with the bios bits enabled grub and boot =
off with it. Grub-mkrescue is a bash script that uses mformat and =
xorriso.=20=


