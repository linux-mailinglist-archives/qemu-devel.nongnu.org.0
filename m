Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B9297DDB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 19:50:23 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWNgM-0005IG-KS
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 13:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWNfC-0004pD-LE
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 13:49:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWNfA-0002H4-Et
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 13:49:10 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f94691b0000>; Sat, 24 Oct 2020 10:49:15 -0700
Received: from [10.40.102.184] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 24 Oct
 2020 17:48:47 +0000
Subject: Re: [PATCH v28 00/17] Add migration support for VFIO devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <alex.williamson@redhat.com>, <cjia@nvidia.com>
References: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
 <5e8b3347-ba20-7511-1e84-a9e42a6ab430@redhat.com>
X-Nvconfidentiality: Public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <4561712d-1770-8850-24fe-0578efcf4646@nvidia.com>
Date: Sat, 24 Oct 2020 23:18:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5e8b3347-ba20-7511-1e84-a9e42a6ab430@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603561755; bh=IAEd6k/gKNARvU6Pwx96YtvCMFt2Mprh0GmDL0yPlAY=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=o5gDS39L3QeWXxEn2uOgR/QDe8ehwoqpVS3J4pUBnCzajQZGoxyMWJwy3eyXHf/T3
 ueE3aitw6Fl/NaliJ1QL099WtwgxRlojbaLrftQznnSQD0jEtiyahLzyIkrgbPIciy
 LpEBRDtIndEJVs+2HaYDEPWUzxNaWdhQcO4dZftxqRr/et8UYMJWymBwJFLnC4WrXn
 49b9KlhVdGTKKBXIaDB3ZzXhJ3MhAy5MgdGYMSkDlW/KONjtDktLJEMhzLYoNxvXOq
 I/zmwXSopO13eyWJDNXkwaNDNiVyLvrVRQpmESxL7HbQMOeEXgHmWBiKUGgNgAKnMn
 1qC0ebVD38aWg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 13:49:06
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: zhi.wang.linux@gmail.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eauger@redhat.com, artemp@nvidia.com, yi.l.liu@intel.com, quintela@redhat.com,
 ziye.yang@intel.com, armbru@redhat.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, felipe@nutanix.com, zhi.a.wang@intel.com,
 mcrossley@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 eskultet@redhat.com, dgilbert@redhat.com, changpeng.liu@intel.com,
 cohuck@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/24/2020 10:26 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Kirti,
>=20
> On 10/23/20 12:40 PM, Kirti Wankhede wrote:
>> Hi,
>>
>> This Patch set adds migration support for VFIO devices in QEMU.
> ...
>=20
>> Since there is no device which has hardware support for system memmory
>> dirty bitmap tracking, right now there is no other API from vendor drive=
r
>> to VFIO IOMMU module to report dirty pages. In future, when such hardwar=
e
>> support will be implemented, an API will be required in kernel such that
>> vendor driver could report dirty pages to VFIO module during migration=20
>> phases.
>>
>> Below is the flow of state change for live migration where states in=20
>> brackets
>> represent VM state, migration state and VFIO device state as:
>> =C2=A0=C2=A0=C2=A0=C2=A0 (VM state, MIGRATION_STATUS, VFIO_DEVICE_STATE)
>>
>> Live migration save path:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QEMU normal running sta=
te
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (RUNNING, _NONE, _RUNNI=
NG)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 migrate_init spawns migration_thread.
>> =C2=A0=C2=A0=C2=A0=C2=A0 (RUNNING, _SETUP, _RUNNING|_SAVING)
>> =C2=A0=C2=A0=C2=A0=C2=A0 Migration thread then calls each device's .save=
_setup()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 (RUNNING, _ACTIVE, _RUNNING|_SAVING)
>> =C2=A0=C2=A0=C2=A0=C2=A0 If device is active, get pending bytes by .save=
_live_pending()
>> =C2=A0=C2=A0=C2=A0=C2=A0 if pending bytes >=3D threshold_size,=C2=A0 cal=
l save_live_iterate()
>> =C2=A0=C2=A0=C2=A0=C2=A0 Data of VFIO device for pre-copy phase is copie=
d.
>> =C2=A0=C2=A0=C2=A0=C2=A0 Iterate till total pending bytes converge and a=
re less than=20
>> threshold
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 On migration completion, vCPUs stops and calls=
=20
>> .save_live_complete_precopy
>> =C2=A0=C2=A0=C2=A0=C2=A0 for each active device. VFIO device is then tra=
nsitioned in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _SAVING state.
>> =C2=A0=C2=A0=C2=A0=C2=A0 (FINISH_MIGRATE, _DEVICE, _SAVING)
>> =C2=A0=C2=A0=C2=A0=C2=A0 For VFIO device, iterate in .save_live_complete=
_precopy until
>> =C2=A0=C2=A0=C2=A0=C2=A0 pending data is 0.
>> =C2=A0=C2=A0=C2=A0=C2=A0 (FINISH_MIGRATE, _DEVICE, _STOPPED)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
>> =C2=A0=C2=A0=C2=A0=C2=A0 Migraton thread schedule cleanup bottom half an=
d exit
>>
>> Live migration resume path:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Incomming migration calls .load_setup for each =
device
>> =C2=A0=C2=A0=C2=A0=C2=A0 (RESTORE_VM, _ACTIVE, _STOPPED)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 For each device, .load_state is called for that=
 device section data
>> =C2=A0=C2=A0=C2=A0=C2=A0 (RESTORE_VM, _ACTIVE, _RESUMING)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0 At the end, called .load_cleanup for each devic=
e and vCPUs are=20
>> started.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (RUNNING, _NONE, _RUNNI=
NG)
>>
>> Note that:
>> - Migration post copy is not supported.
>=20
> Can you commit this ^^^ somewhere in docs/devel/ please?
> (as a patch on top of this series)
>=20

Philippe, Alex,
I'm going to respin this series with r-bs and fix suggested by Yan.
Should this doc be part of this series or we can add it later after=20
10/27 if again review of this doc would need some iterations?

Thanks,
Kirti

