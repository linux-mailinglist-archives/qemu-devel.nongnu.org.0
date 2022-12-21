Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013A65341C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 17:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p821O-0001zW-CR; Wed, 21 Dec 2022 11:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p821M-0001zF-Ts
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p821K-0003XW-Qw
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671640361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CDFEEXfN7oLMVC+N/Zr4BgD3O0IxzimUCUkan9DGGsg=;
 b=bBa3d2wmZtHaa3LkX3zMGs1kjrtpqchtGq8ZYSfr1dZR0Qdk7dd8gflI490RMpzWZa8U/g
 rfHBpKgerFYoP7m+qsdjz910NK3LCh9pQElTLM1UORRxluPH6PPpTG+R7HbCNqe7kTOsc5
 gTXlQNjfOQlnblPbHj7f+EFRn4Ukau0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-uhEWZzkrM3e-WHb-wMptMQ-1; Wed, 21 Dec 2022 11:32:37 -0500
X-MC-Unique: uhEWZzkrM3e-WHb-wMptMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5074B80D0E1;
 Wed, 21 Dec 2022 16:32:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A2CA492C14;
 Wed, 21 Dec 2022 16:32:35 +0000 (UTC)
Date: Wed, 21 Dec 2022 16:32:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 1/2] tpm: convert tpmdev options processing to new
 visitor format
Message-ID: <Y6M1FkKxnRv1Ev3I@redhat.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
 <20221219131344.18909-2-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219131344.18909-2-jejb@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 08:13:43AM -0500, James Bottomley wrote:
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> Instead of processing the tpmdev options using the old qemu options,
> convert to the new visitor format which also allows the passing of
> json on the command line.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> ---
>  backends/tpm/tpm_emulator.c    | 35 ++++++-------
>  backends/tpm/tpm_passthrough.c | 37 +++++---------
>  include/sysemu/tpm.h           |  4 +-
>  include/sysemu/tpm_backend.h   |  2 +-
>  monitor/hmp-cmds.c             |  4 +-
>  qapi/tpm.json                  | 26 ++--------
>  softmmu/tpm.c                  | 90 ++++++++++++++--------------------
>  softmmu/vl.c                   | 19 +------
>  8 files changed, 73 insertions(+), 144 deletions(-)
> 

> diff --git a/qapi/tpm.json b/qapi/tpm.json
> index 4e2ea9756a..d8cbd5ea0e 100644
> --- a/qapi/tpm.json
> +++ b/qapi/tpm.json
> @@ -99,39 +99,23 @@
>  { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
>    'if': 'CONFIG_TPM' }
>  
> -##
> -# @TPMPassthroughOptionsWrapper:
> -#
> -# Since: 1.5
> -##
> -{ 'struct': 'TPMPassthroughOptionsWrapper',
> -  'data': { 'data': 'TPMPassthroughOptions' },
> -  'if': 'CONFIG_TPM' }
> -
> -##
> -# @TPMEmulatorOptionsWrapper:
> -#
> -# Since: 2.11
> -##
> -{ 'struct': 'TPMEmulatorOptionsWrapper',
> -  'data': { 'data': 'TPMEmulatorOptions' },
> -  'if': 'CONFIG_TPM' }
> -
>  ##
>  # @TpmTypeOptions:
>  #
>  # A union referencing different TPM backend types' configuration options
>  #
> +# @id: identifier of the backend
>  # @type: - 'passthrough' The configuration options for the TPM passthrough type
>  #        - 'emulator' The configuration options for TPM emulator backend type
>  #
>  # Since: 1.5
>  ##
>  { 'union': 'TpmTypeOptions',
> -  'base': { 'type': 'TpmType' },
> +  'base': { 'type': 'TpmType',
> +            'id': 'str' },
>    'discriminator': 'type',
> -  'data': { 'passthrough' : 'TPMPassthroughOptionsWrapper',
> -            'emulator': 'TPMEmulatorOptionsWrapper' },
> +  'data': { 'passthrough' : 'TPMPassthroughOptions',
> +            'emulator': 'TPMEmulatorOptions' },
>    'if': 'CONFIG_TPM' }

This isn't a valid change todo, as it affects the public facing
data structure for the  query-tpm command.

I understand why you're doing it though, to get rid fo the
extra nesting, which is a hangover from earlier QAPI days
where we couldn't cope with flat unions.

Instead of changing TpmTypeOptions, you'll need to introduce
a new TpmTypeCreateOptions that eliminates the wrapping, and
use that in the CLI creation path, leaving the query-tpm
command unchanged.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


