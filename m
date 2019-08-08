Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73F857FF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 04:08:21 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvXqm-0005EK-Nl
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 22:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54293)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvXqJ-0004cB-0k
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvXqI-00069z-23
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:07:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:10589)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hvXqH-00069M-QQ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 22:07:50 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 19:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="258567240"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 07 Aug 2019 19:07:46 -0700
Date: Thu, 8 Aug 2019 10:07:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 marcandre.lureau@redhat.com
Message-ID: <20190808020723.GB26938@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [Fail] tests/test-util-filemonitor fails
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current qemu fails tests/test-util-filemonitor.

By bisect, it shows this commit introduced the error. 

commit ff3dc8fefe953fd3650279e064bf63b212c5699a
Author: Daniel P. Berrang茅 <berrange@redhat.com>
Date:   Wed Mar 13 17:36:18 2019 +0000

    filemon: ensure watch IDs are unique to QFileMonitor scope
    
    The watch IDs are mistakenly only unique within the scope of the
    directory being monitored. This is not useful for clients which are
    monitoring multiple directories. They require watch IDs to be unique
    globally within the QFileMonitor scope.

After revert 

"filemon: ensure watch IDs are unique to QFileMonitor scope"
"filemon: fix watch IDs to avoid potential wraparound issues"

The test pass.

-- 
Wei Yang
Help you, Help me

