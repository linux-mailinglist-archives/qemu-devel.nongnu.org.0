Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6AA8705E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 06:01:09 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvw5T-0002Q9-Sp
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 00:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wentong.wu@intel.com>) id 1hvw4y-0001zm-0Y
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wentong.wu@intel.com>) id 1hvw4w-0006qp-BB
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:00:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:18163)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wentong.wu@intel.com>)
 id 1hvw4w-0006kr-1D
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:00:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 21:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
 d="scan'208,217";a="350383940"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga005.jf.intel.com with ESMTP; 08 Aug 2019 21:00:23 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 8 Aug 2019 21:00:23 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 8 Aug 2019 21:00:23 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.204]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.112]) with mapi id 14.03.0439.000;
 Fri, 9 Aug 2019 12:00:21 +0800
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: qemu icount mode timer accuracy
Thread-Index: AdVOYV9YomMNai4qTsa2jpTa1UmfJQ==
Date: Fri, 9 Aug 2019 04:00:20 +0000
Message-ID: <228A20DABA3D9846AF1B64E31C217296010E8CE3@SHSMSX106.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzY2NzVkMWUtNTZkOS00YTQ3LTk4NDEtMzVkNTE5NGY2Mzk5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSk93Q1dCYmJkUmtxaU5pRkkxSnpDM0gzelVTQUw0aW9iYU1WRDdleWVTcHpHbkdkT2R0Q3ZSR0N6K1FLaU1rMCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] qemu icount mode timer accuracy
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

Recently I'm working to enable Qemu icount mode with TCG, with source code =
review I found that Qemu can give deterministic execution for guest code ti=
meout. But for exact time point for guest OS, I have a question:

For armv7m_systick.c example, guest OS will use systick_read which will cal=
l "t =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL); " to calculate his exact ti=
me point, and qemu_clock_get_ns will use qemu_icount. But from qemu_tcg_rr_=
cpu_thread_fn { prepare_icount_for_run(cpu); r =3D tcg_cpu_exec(cpu); proce=
ss_icount_data(cpu);}, we know qemu just update qemu_icount value after tcg=
_cpu_exec, so for each tcg_cpu_exec execution there is the same qemu_icount=
 value, and then guest code will get the same time point for that one tcg e=
xecution. Can someone confirm that?



Thanks
