Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72B328151
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:51:37 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjtY-00045m-8V
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjs0-0002re-Tx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:50:02 -0500
Received: from rev.ng ([5.9.113.41]:54589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjry-0008I4-AO
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLr+FdnFXCR4h7HSkeEYndtvVvxlUmvlp4GGPH2ccgA=; b=S/uA4Bfe/C+ej7iWO5eaULKvdV
 g09usyuV1p+RD2eXuF45mmpKqKe3rFN/2yOllmMAI/TUEHHAKmyO6aauJuuk1Cvv2sVQ/xtuTwjHT
 EerEH2Kf0iBu/WZ6O8ArRF/Npa7nE2EbHtL9uq7tLMsbES2ZbLL0WTk2q18jcucIx2pA=;
Date: Mon, 1 Mar 2021 15:49:49 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com
Subject: Re: [PATCH v2 09/10] target/hexagon: call idef-parser functions
Message-ID: <20210301154932.302ad5e3@orange>
In-Reply-To: <87605056-2b5f-842f-1cf5-e0d205584f1b@linaro.org>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-10-ale.qemu@rev.ng>
 <87605056-2b5f-842f-1cf5-e0d205584f1b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Thu, 25 Feb 2021 19:47:04 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> > +            elif hex_common.is_new_val(regtype, regid, tag):
> > +                declared.append("%s%sN" % (regtype,regid))
> > +            else:
> > +                print("Bad register parse:",regtype,regid,toss,numregs)  
> 
> print, but nothing to force exit-with-failure, now or at a later
> date.  Just raise a python exception?

Yes, the whole error handling should be improved in the script.

Our goal was to get this patchset in and then do another pass to clean
up things later on. However, if you deem this is the proper time to
do it, we can go for it.

-- 
Alessandro Di Federico
rev.ng

