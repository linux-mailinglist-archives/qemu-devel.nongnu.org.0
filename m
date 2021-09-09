Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD740439A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 04:35:43 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO9ug-0002iG-6z
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 22:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mO9tf-00021Z-8b
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:34:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:39953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mO9tb-0005rD-FA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:34:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220707938"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="220707938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 19:34:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="539200526"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 08 Sep 2021 19:34:29 -0700
Date: Thu, 9 Sep 2021 10:20:36 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/7] i386: Add sgx_get_info() interface
Message-ID: <20210909022036.GB21362@yangzhon-Virtual>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-4-yang.zhong@intel.com>
 <8802ca02-9ebf-d599-f6b4-87ae5640dad4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8802ca02-9ebf-d599-f6b4-87ae5640dad4@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:32:27AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/8/21 10:19 AM, Yang Zhong wrote:
> > Add the sgx_get_info() interface for hmp and QMP usage, which
> > will get the SGX info from this API.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/i386/sgx.c         | 21 +++++++++++++++++++++
> >  include/hw/i386/sgx.h | 11 +++++++++++
> >  target/i386/monitor.c | 32 ++++++++++++++++++++++++++++----
> >  3 files changed, 60 insertions(+), 4 deletions(-)
> >  create mode 100644 include/hw/i386/sgx.h
> 
> > @@ -766,12 +767,35 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> >  
> >  SGXInfo *qmp_query_sgx(Error **errp)
> >  {
> > -    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
> 
> >  void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> >  {
> > -    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
> > -    return NULL;
> 
> What is the point of patches #1 & #2? Why not squash all here?

  Philippe, The different user usage, Monitor and QMP tool to get the some info from VM.
  I am okay to squash those 3 patches into ones, thanks!

  Yang 

