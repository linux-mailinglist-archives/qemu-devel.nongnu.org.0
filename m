Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F125F43B572
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:23:19 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOIJ-0001ZF-1w
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO9b-0006AE-2n
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO9Z-0003Z1-B3
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/T4sM39EPDWhLh7FV6n0mdxypeW5kyL6rY0c+a8oZs=;
 b=HOKziOBhUuU5msMBHwygx1ltpAiCPePnMgn9GX6tb9Y8++N59T3A+aRlJTYaiCEwW7p+Ct
 /Z04EvPBY8z1MAu+Z77KKdFWov/e5Gp48QFJhiJywOnn0bRcIbsXhPa5w1z0jx3Ik4VieS
 dyLI/SOpJS3u+cqo+dHNTAwcF8fvrdg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-AW7eWCJGNwuGgoyvXScivA-1; Tue, 26 Oct 2021 11:14:15 -0400
X-MC-Unique: AW7eWCJGNwuGgoyvXScivA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso4088302wri.17
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V/T4sM39EPDWhLh7FV6n0mdxypeW5kyL6rY0c+a8oZs=;
 b=OeIB9MPRu5N5WloWuOZzDxnX3r55fLna5j9fgk9O61UFU2PS3KLv/ghMoIwtcrxfko
 oo+Zg3Bk4nv7DaQNyuuH5VTcUTAcL2FVhiWVSKm3oguFzodQNzuE0jg/lIh9Z1ccM3zj
 zdRkiK+VH1KEe/3Kx8nT+a/GtsziOzi8kDkYPKkecAn7ozvNTuRAl7vi6B1hPwD2le0R
 b8C66BeCeI0OP6kDOHwVbMLz05e2x9Q8N2QBXYSHsSEMv0A4sCwuq/4Ui2ObBnrnqmI7
 zcrp4IgC3zbHpL8qKMBWIYRN+lzlEslMGfU3WZObrMXfDP3mG0I3eGKbCo6UZaOl4f2i
 bFZQ==
X-Gm-Message-State: AOAM531/Ee6YuGcs6jf2VlcSN9Mje8NFIEOinEMRmUowooPGVqB2knYi
 OdVXtg5/oT9jv0nr/GlRw2ZfTtrX9KAF10spkJsLt9aUukQyqkI89l9sC1vryUmsBTaftQBpJ83
 M5wjDLdNcXrxyMiA=
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr32817060wrr.146.1635261252287; 
 Tue, 26 Oct 2021 08:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt+07dhVQcINgPn89Xe9syt0wFzi6gPj5VixWCvijrNyoUVG49vKEs9coreVtHQuxVus+BJg==
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr32816837wrr.146.1635261250307; 
 Tue, 26 Oct 2021 08:14:10 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o194sm985304wme.40.2021.10.26.08.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:14:09 -0700 (PDT)
Message-ID: <6fc89222-c836-a52b-2d67-fd8a8b175e58@redhat.com>
Date: Tue, 26 Oct 2021 17:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] hw/smbios: Use qapi for SmbiosEntryPointType
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-3-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026151100.1691925-3-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 17:10, Eduardo Habkost wrote:
> This prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
> 
> Based on a patch from Daniel P. Berrangé.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> First version of this code was submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
> 
> Changes from v2:
> * Rename "2_0"/"3_1" to "32"/"64", to
>   make the names more QAPI-friendly (as underscores and dots are
>   not allowed by QAPI)
> * Move definition from smbios.json back to machine.json
>   (no need for a separate file just for one enum)
> 
> Changes from v1:
> * Patch was split in two
> * Moved definition to smbios.json
> ---
>  include/hw/firmware/smbios.h | 10 ++--------
>  qapi/machine.json            | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 8 deletions(-)

> +##
> +# @SmbiosEntryPointType:
> +#
> +# @32: SMBIOS version 2.1 (32-bit) Entry Point
> +#
> +# @64: SMBIOS version 3.0 (64-bit) Entry Point
> +#
> +# Since: 6.1

6.2, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '32', '64' ] }
> 


