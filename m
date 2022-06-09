Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A9544BE6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:31 +0200 (CEST)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHDC-0004ZF-4i
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEOO-0003mp-3U
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEOK-0008Ps-SQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cd9ukisOY0gOEFhV2JgED6l0+jZEjI4L8XqTwTaFXqU=;
 b=EDJlJIvj9Atp+5q4AcI+w7T/V7wiU1LH28VWfr64ZnebRlz2sab2w8CT0vIXuk2LPFxmRX
 NzNCAM4cI8tGhVqP5DNJ3n5LpLV2/EP3gy6yB01nlqGzRJvdvVrYD2r1YFYxzNSxwfkhr+
 wJd8baZWOWEZruiX8KfGLrHIOx3ZADA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-USg7TztyNjiUILq0uSWQ4g-1; Thu, 09 Jun 2022 05:23:45 -0400
X-MC-Unique: USg7TztyNjiUILq0uSWQ4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C32088026E0;
 Thu,  9 Jun 2022 09:23:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9370B492C3B;
 Thu,  9 Jun 2022 09:23:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A51E1800094; Thu,  9 Jun 2022 11:23:43 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:23:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220609092343.sdqb67wd62of7usp@sirius.home.kraxel.org>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
 <20220531202327.14636-3-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531202327.14636-3-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 31, 2022 at 01:23:27PM -0700, Dongwon Kim wrote:
> New integer array parameter, 'monitor' is for specifying the target
> displays where individual QEMU windows are placed upon launching.
> 
> The array contains a series of numbers representing the monitor where
> QEMU windows are placed.
> 
> Numbers in the array are mapped to QEMU windows like,
> 
> [1st detached window, 2nd detached window,.... Main window]
> 
> Usage example: -display gtk,monitor.0=0,monitor.1=1.....

Both patches look good to me.  

> +# @monitor:     Array of numbers, each of which represents physical
> +#               monitor where individual QEMU window is placed in case
> +#               there are multiple of them
> +#               since 7.1
>  #
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*monitor'       : ['uint16']  } }

This is what we've agreed to, so I guess this is fine with the QAPI
maintainers too?  Can I have an ack then?

thanks,
  Gerd


