Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC951C132
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:47:15 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbp3-0003Da-TB
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmbnn-0002Wi-VT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:45:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:33867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmbnk-0006va-Um
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651758351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ynKRxKqlKTMJ7gngWaJT5CrqdBzWTa0g+MwrD/jNXNY=;
 b=Q0jXieTDVMIa9D2dDIqAjLrdHZ5oseqSVmTLxa2CUmjBajNoBpp3K8z+9vnwENL1FdNhLI
 Htzh0a7/RFhTKmw5CryMMCIEJ7t5/XiZVadL0eukGIMV54ACt3v8ddGggsfyLUJGP8Xq/x
 IGWU9nIrhYwEJGdHeoj+TmA1HqLojMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-MQeSkZiZMg2FOcZeQWwm5Q-1; Thu, 05 May 2022 09:45:50 -0400
X-MC-Unique: MQeSkZiZMg2FOcZeQWwm5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C323811E75;
 Thu,  5 May 2022 13:45:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01EB24010122;
 Thu,  5 May 2022 13:45:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAAE121E6880; Thu,  5 May 2022 15:45:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  mark.kanda@oracle.com,  berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 3/8] qmp: add filtering of statistics by target vCPU
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-4-pbonzini@redhat.com>
Date: Thu, 05 May 2022 15:45:48 +0200
In-Reply-To: <20220426141619.304611-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Tue, 26 Apr 2022 16:16:14 +0200")
Message-ID: <87y1zgrt2r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Introduce a simple filtering of statistics, that allows to retrieve
> statistics for a subset of the guest vCPUs.  This will be used for
> example by the HMP monitor, in order to retrieve the statistics
> for the currently selected CPU.
>
> Example:
> { "execute": "query-stats",
>   "arguments": {
>     "target": "vcpu",
>     "vcpus": [ "/machine/unattached/device[2]",
>                "/machine/unattached/device[4]" ] } }

What heartless people put these poor vCPUs in the orphanage?

>
> Extracted from a patch by Mark Kanda.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

[...]

> diff --git a/qapi/stats.json b/qapi/stats.json
> index bcc897258a..26ee69588f 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -65,6 +65,16 @@
>  { 'enum': 'StatsTarget',
>    'data': [ 'vm', 'vcpu' ] }
>  
> +##
> +# @StatsVCPUFilter:
> +#
> +# @vcpus: list of qom paths for the desired vCPU objects.

"QOM paths", because that's how we spell it elsewhere.

> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsVCPUFilter',
> +  'data': { '*vcpus': [ 'str' ] } }
> +
>  ##
>  # @StatsFilter:
>  #
> @@ -73,8 +83,10 @@
>  #
>  # Since: 7.1
>  ##
> -{ 'struct': 'StatsFilter',
> -  'data': { 'target': 'StatsTarget' } }
> +{ 'union': 'StatsFilter',
> +        'base': { 'target': 'StatsTarget' },
> +  'discriminator': 'target',
> +  'data': { 'vcpu': 'StatsVCPUFilter' } }
>  
>  ##
>  # @StatsValue:


