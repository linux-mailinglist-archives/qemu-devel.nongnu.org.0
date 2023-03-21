Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1016C3A0C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 20:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pehPN-0007q2-0q; Tue, 21 Mar 2023 15:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1pehPK-0007ov-MQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:12:30 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1pehPE-0004NI-VG
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679425945; x=1710961945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yDL9PO4jnyUEu24jNBpIEuS8zCdoWqdTChNmQRFSp2Q=;
 b=Ca0cEBNvn3ASZDj6/RxfqK4i5P9v/MR7uaQoRICE4Wl6h7SqtcBXTdEp
 IiXgEEw38AAPCdsBJAltmVpazmhM4cS26bTz/L5X63VlvOhyf9kca5cjn
 pQUnDIAvNgV+C2f7V1+4OCVgWakIB1E9xDonSm1X1C20Vc1oehr8MEGu/
 P2IPsJV04sLNlzbvD+kf3rJnm3clzNxdVqSxDwAZwWtDR7W/PZyeYj1/v
 GoqWg/2KX1lRxNlxi+Zo10bhMZmMtZ3Sou/+1IcQ/w2qztK/iLooA8SOQ
 UYkUCgku7QuihKEBYHdN+xeiT6RSi1hdQLAqtynEw/582ULD7Fhb20aDp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401606768"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="401606768"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 12:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714111522"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="714111522"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 21 Mar 2023 12:12:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 12:12:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 12:12:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 12:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WO3E6XfYIJQ6ctMfO3hbYfwosoJErKW78BOgPE//Cy2WAkQReDtxtlq/0Wf47ljhtAvVCoSgZP21VNEe3B3q7FiLcYrMuGpa+w6eUXC2uRLicMz7/VZ2sPpnclTqcG55YwjkQgFfhzWM4sp3W/gXaqBIv8zQ4kApP9f785Qcnaz37IbfLKdu7SCTRFyi8QYmdyk+o3xu76HfGTVhjETKfhT6ZKDQwVXAEVJSlzGUk03NV+zt/1keaTn2TrLcZXF3dXlJls5I/r6zXt3JJLZuwybkP+XQTWZNOnNg1qCzx+ziNI2l7hUYn8vjpI0nti7OzP7eG8FXZTAe+4LZ/7QTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQFWBzw7hocoav0TKMAI9wHT6idAjmjaq7fopFixe+4=;
 b=eGtotvroIBKaK9AKp6dRSwimT+AHClvHPf5C7hgefCo9NPfCue2IMNDOMxB/yZmcD2zKXceMFDiG2l+baAyIgUG+IrH36ljSBGad9rTwasdTD2Vz0csj23oKRx3m4nlhxnbYef9iBCh13yuGqqhM8okEfFereywsXv7wC2VoxatY6UAGbsrM1/i6cGByThqFxG01l8pAi90nWai4FlDmCF7HvDyxQGKiBZfnqfOvJBlYsjelnY4SycS5f9+VcUbxMjdrXz3L3HsD1CPZ9SlEvZ1okdFRtd5NapGKi6F6fFiNiw7cL0Fy3p+zYUlG6OozMErt+M4uNPUT25TIMjlYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 19:12:17 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 19:12:17 +0000
Date: Tue, 21 Mar 2023 12:12:14 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, <Jonathan.Cameron@huawei.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: RE: [PATCH] hw/acpi/cxl: Drop device-memory support from CFMWS entries
Message-ID: <641a018ed7fb8_269929455@dwillia2-xfh.jf.intel.com.notmuch>
References: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 972822e8-91da-450a-1ab5-08db2a402f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHN8qS0jbvuWGq0LLDYk1afHc89/SM+aN25a95uu/T9OO9KCi1FSEu0GEKjnviFT2MnzCrVOwE9cBkC5wGpmiragRpr647vFupilxWUKXHagM0SCE21oOHzyUm5p638ykgSU9pJ4six+4ZIiBhxp3m9UOL5Qsvx5j6BFG1dSCzn2FEOfx0Xv/wpVtOSOj9e0fGLLEHPdU7pkKGoKcgH2gAbK3COBA64HEH+u5qnMESyPnncyYShFfnHOnp8V8It7ITG6IBO6Rwl5QGeZYNaZQ3btEWczKGRg/ZCV4ItAMeIWgzv9uYd66C9m2yycwMU1qnQAUqhZjvf6NmGUgrXm23uKtJDDqZM2aMmA5m6LijatZeixg2IxiENo0eMjmcEUoCUIPSwIcTTTbmqv0xvLzSg1TbWj9DyieN1+mFUD5cj+EkURV9ijZro8qsTYI+ISAJHzUeuP1CvnEP8PZirHlpftlw0q7xn46OaOyKwAY6jSKTNrnXidq70rn8nj+gJom46Xt++omdtpjnjHfqmDa8dsZjlnJbkmePgwB+LOPZ5SFhJEkM/+qRhdsgIIQhjyI944fNx7ozoKe/3ptUpzRa9gkaCKoxQLK9HLzHycVnb84zqRWVHFiKIE5S3LmnMuinOgEiOas8dcTZP541oVTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(38100700002)(66946007)(4326008)(66556008)(8676002)(66476007)(316002)(41300700001)(82960400001)(478600001)(6486002)(8936002)(5660300002)(4744005)(2906002)(86362001)(83380400001)(186003)(6506007)(6512007)(6666004)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z71XQK3YJfqG0aILgTyGAPOcJq37EkzYmLwaQSxFUeaI0EXtyqYXo/iQVZyr?=
 =?us-ascii?Q?kn/8srvr3DKHhjzuFGhpfO6vm20sbAqCaIPOcF6wZvf7eQh1gnhF6MlBA4qm?=
 =?us-ascii?Q?VU8uedx5vvFjmq9QLifu6QZb/f77vwWcVsaPj1ZqH6e+rzCxv/X3xkLZLEVu?=
 =?us-ascii?Q?l61U0XJ/0+2EGOZMqC8B2q4vcWUah1YhsVrA5qTa1UHKsHzM5xWAkpoN0wkf?=
 =?us-ascii?Q?rxKPPZ+xjSpvMYQABnoKArCFpb1nNTg0BMObYBOuGTOapgy5JHR0JnzDi7oj?=
 =?us-ascii?Q?S3Dm5MRK/mSOVxnQP5EINK8/DojRMLlfxgbDuv+KeNeClHy/gjC+AAoxVBsl?=
 =?us-ascii?Q?OvruS7mGwvuB/BKrO8m8rmsAGdFWYjYQgjsiDbhXcy3AyZMBJcnnUyenzOuD?=
 =?us-ascii?Q?fAv+UXhbikYer+l9SxcyU3dC3iJKkwsLohuL9EwLa+mfdNQbkWgrTPJsdgvR?=
 =?us-ascii?Q?FofYSCD3n7to3UW1tF/M/M3Yr7GMuw3ghq+w19CJRypqVlAYpnFnCC8s70qc?=
 =?us-ascii?Q?tB663BFrHxhVkM/F8AZWHWxdgc4Hv4ZUF+Doh4z0ng07QFqaq4p/SRkY44H9?=
 =?us-ascii?Q?CUZPpL2XyMyOYPV2/U+kbRzqazMgkuaiWtnXepOFcIPpm9IYurY4kVcVawrw?=
 =?us-ascii?Q?Pc5CQlddI+nKObGfd7+GJoRwQMcMx/MmZtSuUaPo8aH7YdmCMNfXtg7+9p5g?=
 =?us-ascii?Q?3+firKedvvTsA181esuJIBLIx9TsJ5zrECJQ347KHH13+6DP0YZlnzGE9YOK?=
 =?us-ascii?Q?hcXnzu+x+AlWw9b3H0cbqiv+PLlmZt89hzG4Ixq8q/aaoAGbtEnf7R5eiQIT?=
 =?us-ascii?Q?D5gMWi0YY8LUwT6jlAIfEirmvYTouaiNUNnWomRwUVbUyJM2OYiyjTBEO5Oa?=
 =?us-ascii?Q?TL7VM9xeQW/hkNdlbQHFtJpPdLQ4f44/+ju2BBVxIoeKmDpZSjgtsSOA4NHa?=
 =?us-ascii?Q?OjthL4QBR85fRmZTdwATJE+QUap8htG4ijR1IX9QVSXpnH3bpAhcZDUWwgJF?=
 =?us-ascii?Q?ms9EXTDaD/aWU9nXKZG4xYUVv8wWBq+YHxkqhyk8yVg2YoZbiR3QlK1FMIbI?=
 =?us-ascii?Q?qlNKzPvwnHiD80sDmkjTT2jBmRsa56uWoTr+BnULFcWgQoR4w8XCYFoCi1Wa?=
 =?us-ascii?Q?5N8a3d9nsAeH17DkE5Nt44ik4/GxVac0vq9z5UEw2zxwtc4ACnNFgPEULL3m?=
 =?us-ascii?Q?2IqqK7Kgk3FqGud2wd9HRr18RyfK/FNQ10ofNkR/fwFfPYUyprwVjDGhVhJA?=
 =?us-ascii?Q?Ou5LBrA2CSHsTgOYLF1hWAgGPA27SD8fuCK26/90jXC6XuXWRNE5XplL8kBq?=
 =?us-ascii?Q?p4vJnViN5PGYzyzThFuCcU5Bl4XitBSriMuDZHktKaeCn+SoLBoUfxFRxC0G?=
 =?us-ascii?Q?ZNYyMcnC7tcr4Jl8m7O65Sbzq7LnV08DFBihzfXq812LmMmLdIk0VGzL6DQ/?=
 =?us-ascii?Q?7KMWfGLFkCmyOWu8Yqr8dWvrOB9TaFP/ho7KWQRkgULKlZplaC62OewjY8RP?=
 =?us-ascii?Q?G5Y+g35hh/sqtsYUAyO0oAmg4XpOBrUIqSVXxPB0W7Na/VWSV/RoerK0pma1?=
 =?us-ascii?Q?xoI5emG3c7ukXhCKttF6aTFCyAJlttnO58qKN728Rdi+AjRqCh4VbiB7RReR?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972822e8-91da-450a-1ab5-08db2a402f84
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 19:12:16.9017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rl3/r9WqpjnDedrpZS4A+ezmDDletjYLi8NN2htDY8GMzmyqMuAODMp/8mbOK7/2/2N/n/2z71t2aGv0WTLafjYPwG5Hptz73lEBAF3WMq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dan.j.williams@intel.com; helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Dan Williams wrote:
> While it was a reasonable idea to specify no window restricitions at the
> outset of the CXL emulation support, it turns out that in practice a
> platform will never follow the QEMU example of specifying simultaneous
> support for HDM-H and HDM-D[B] in a single window.
> 
> HDM-D mandates extra bus cycles for host/device bias protocol, and HDM-DB
> mandates extra bus cycles for back-invalidate protocol, so hardware must
> be explicitly prepared for device-memory unlike host-only memory
> (HDM-H).
> 
> In preparation for the kernel dropping support for windows that do not
> select between device and host-only memory, move QEMU exclusively to
> declaring host-only windows.

After an offline discussion determined that a sufficiently sophisticated
platform might be able to support mixed HDM-H and HDM-D[B] in the same
window, so the kernel is not going to drop this support.

