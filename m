Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E7567929
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 23:04:28 +0200 (CEST)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8pic-0005DD-Mu
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 17:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o8phU-00041d-8m
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:03:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:31548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o8phR-0008VT-Nj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657054993; x=1688590993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VpCr8bGaz1WbVO71ryyEDoNQwlhyHU9D5hta6lj4AYw=;
 b=dUOLmvP6+S9a7Yp//OQq2L44sE1aP8Uftjbqv3EMCcvyniRbWaOdaIoa
 zgIAXZh1ddHOGAhcT33omJuHIODPCelK+3zVt2GO6UWBxdTzuLgQEu3U+
 Gx+IABkpLoE4VhDaXBkl/YSq8ndnAXA2VrBiJf6Zk0SvDBQ8ckVxjQASN
 if8qhRJUfsl55LRRC3IQggFrnHIUd8NWfsFxeyIum3WLXoZFr97EtAGEz
 PInepjpugY6/cSnl50TIe1vcG991zs3N9zK1xS22uJxZCQLpX3a8dj880
 3MfCeP/yPpVdsgp4rCrW7po3qptyguQKSWa3nQoEI99NVq8gWJtHAmoJM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="281056365"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="281056365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 14:03:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="567777817"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.114.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 14:03:04 -0700
Date: Tue, 5 Jul 2022 14:03:02 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220705210302.GA582@dongwonk-MOBL.amr.corp.intel.com>
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-3-dongwon.kim@intel.com>
 <87wncy41s1.fsf@pond.sub.org>
 <20220701095848.sqoxzeplraft7hzc@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701095848.sqoxzeplraft7hzc@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, yeah, I will remove '-' and resubmitt the patch.

On Fri, Jul 01, 2022 at 11:58:48AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > +# @monitor:     Array of numbers, each of which represents physical
> > > +#               monitor where GTK window containing a given VC will be
> > > +#               placed. Each monitor number in the array will be
> > > +#               associated with a virtual-console starting from VC0.
> > 
> > Drop the hyphen in "virtual-console".
> > 
> > Is the term "virtual console" obvious?  Gerd?
> 
> I think so, same term is used elsewhere too for the same concept.
> 
> take care,
>   Gerd
> 

