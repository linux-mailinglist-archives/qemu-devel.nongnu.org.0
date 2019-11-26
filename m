Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F010A51A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 21:11:37 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZhBP-000052-VS
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 15:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1iZhAF-0007zt-LD
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 15:10:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1iZhAD-00054H-QF
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 15:10:23 -0500
Received: from nwk-aaemail-lapp01.apple.com ([17.151.62.66]:42308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1iZhAC-00052g-Cv
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 15:10:21 -0500
Received: from pps.filterd (nwk-aaemail-lapp01.apple.com [127.0.0.1])
 by nwk-aaemail-lapp01.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xAQK7dnt011279; Tue, 26 Nov 2019 12:10:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : content-type
 : mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=CB3IElBDl66OjYZAMoV+TZGUt3w6S4iBnkOkmbYa1SM=;
 b=KTC+pHk20AJwCwR8562SOdGK+W5x8HeCM7+N62kOP7r2eXKQ2RideX939pJxBUxRxjaL
 HptDcdFsrpRRXbmBnlj57RfvaxzlaYNfu0YXodiCS67mKZvAJnRs9PokLBH56S/hkHvC
 jAJDvz1nDZInYaiEvAZjC7bz5HAmDgUm+9Zct1nm3ymuTFpHl6gD+Cclmi3gZX5BDEpl
 iBZBhWQpiQHVhFmnj/tpO5K65D2HoKi8U+vWvi2eR/xVrW4mnkJdRQhiM2v4YJ9dQOri
 gDU3XtjM/6cHzlrl/zufnJU/J9eIazmttIZlcwCKTBPsd87T9sNvtQHXvI3jpn9cgI17 CQ== 
Received: from ma1-mtap-s02.corp.apple.com (ma1-mtap-s02.corp.apple.com
 [17.40.76.6])
 by nwk-aaemail-lapp01.apple.com with ESMTP id 2wf4k4mmkb-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 26 Nov 2019 12:10:17 -0800
Received: from nwk-mmpp-sz12.apple.com
 (nwk-mmpp-sz12.apple.com [17.128.115.204]) by ma1-mtap-s02.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q1L00GQDEP3HQ20@ma1-mtap-s02.corp.apple.com>; Tue,
 26 Nov 2019 12:10:16 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz12.apple.com by
 nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q1L00E00EGJ9M00@nwk-mmpp-sz12.apple.com>; Tue,
 26 Nov 2019 12:10:16 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 07468e1da2f6e987d649ff6cb4055ea6
X-Va-E-CD: 0290939b57f26f9636033cc1cdfe3215
X-Va-R-CD: cc7fb021a0d3ff63779d08eb77fd3ee2
X-Va-CD: 0
X-Va-ID: 6e8e123c-778a-413d-952e-e7fb051df89c
X-V-A: 
X-V-T-CD: 07468e1da2f6e987d649ff6cb4055ea6
X-V-E-CD: 0290939b57f26f9636033cc1cdfe3215
X-V-R-CD: cc7fb021a0d3ff63779d08eb77fd3ee2
X-V-CD: 0
X-V-ID: b5b81fd6-3f02-4a68-a6c4-3ecc3a403c0e
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-11-26_06:,, signatures=0
Received: from [17.234.111.141] (unknown [17.234.111.141])
 by nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q1L00ENGEP3UI90@nwk-mmpp-sz12.apple.com>; Tue,
 26 Nov 2019 12:10:16 -0800 (PST)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 0/5] hvf: stability fixes for HVF
In-reply-to: <78511040-b432-c456-b737-50ec839bde30@redhat.com>
Date: Tue, 26 Nov 2019 12:10:15 -0800
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-transfer-encoding: 7bit
Message-id: <C1DEB273-5B29-484B-B9EE-DAFD2B3E77FB@apple.com>
References: <cover.1574625592.git.dirty@apple.com>
 <78511040-b432-c456-b737-50ec839bde30@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-26_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.151.62.66
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
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

Let me see if I can add some assertions.

Cameron Esfahani
dirty@apple.com

"The cake is a lie."

Common wisdom



> On Nov 25, 2019, at 2:28 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> Certainly no doubt about patches 1-4, while for patch 5 I'm wondering if
> it's masking another bug; I'd prefer to have also some assertions that
> interrupt_injected is never an exception and exception_nr is never an
> interrupt.
> 


