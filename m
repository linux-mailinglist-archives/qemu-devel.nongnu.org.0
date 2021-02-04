Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4130EF1C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:58:55 +0100 (CET)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aTV-0005ai-Uj
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7aR3-0004Ym-7A
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7aQz-0005jL-Sr
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612428975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwuHld/iE5eB22DOh0kQtEoLculrE2oP/SdpY1fCY5I=;
 b=Wwh07zZFvWSzBMyvtQ+icp4Ipe4eSYGtBuIkaaW4IlOpRUDoQlSqmGZ+OGP34TqCz8bhOv
 I0UfIr+IXx1nZPpsfD0MKvbJrwN8RBRFMkXlSNdptrQdlUvr33ovUWD5HeYZyuEsR7UXqi
 uUAs++Ky7KkptSnQwso7GiUJQVD1Ce0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-yLOILM5pMrOIAxfCRjnXGA-1; Thu, 04 Feb 2021 03:56:13 -0500
X-MC-Unique: yLOILM5pMrOIAxfCRjnXGA-1
Received: by mail-ej1-f70.google.com with SMTP id q11so2161766ejd.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 00:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FwuHld/iE5eB22DOh0kQtEoLculrE2oP/SdpY1fCY5I=;
 b=arYvVhwT32aUvYnrPuFmS7yIcylhtZQsy5lBNKgi8W8bT+C55NwT4abO0je8CsUZm6
 5ATqVEWcPXqkiy4guSZkSQCBRAm6ki6ArUy+3N0Lghy8cIjo+MAwgy7G/PQCIl0bdfyG
 S9DJvB78UgGOHkIMPogppMfVCDAalMv1vtRwnvKHBuHApelbghFwqOhp7jnvtjcHr+jg
 l75DWWV1JPvh74lYQ7LtSFNVtX8nKS19irZk7/JqGodljeemBfLRMPf9HVeT3db/8Kx9
 2qxy4u54gn5B3IUCc7bgiE9tYxatafPi85k5nGLR1UVBP5GvqDFdFS1ZAIYl1QRf8Tbi
 NoYw==
X-Gm-Message-State: AOAM53329CNvFFl7CWSt0zpcNPufHNbwERQIgx/bCD/Wgc6Lk5OF83M1
 O7lDWQiygmOI8lLQfP0YtCrloces6IrwSVQA/Z7t9HL7q1VqlS8aqIqHvh9kK7LCEYhjVRdY5Wt
 uAvvrR3CBbp7rkSk=
X-Received: by 2002:a17:906:1389:: with SMTP id
 f9mr7129277ejc.442.1612428972789; 
 Thu, 04 Feb 2021 00:56:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+ZJwDTkdvfhkMTdu6Kwlq6CqwmKvHEvAGd5b6LN6dDrg3OmLnC1eXOqDWBcALQRuYqRUKxw==
X-Received: by 2002:a17:906:1389:: with SMTP id
 f9mr7129262ejc.442.1612428972571; 
 Thu, 04 Feb 2021 00:56:12 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id r11sm2080504edt.58.2021.02.04.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 00:56:12 -0800 (PST)
Subject: Re: [PATCH 4/4] i386: acpi: Don't build HPET ACPI entry if HPET is
 disabled
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com
References: <cover.1612424814.git.isaku.yamahata@intel.com>
 <d62e491a87a698dc8fd703815867013e04f49c2c.1612424814.git.isaku.yamahata@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e7888b9b-348b-871c-7d4b-378182baa48d@redhat.com>
Date: Thu, 4 Feb 2021 09:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d62e491a87a698dc8fd703815867013e04f49c2c.1612424814.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 9:04 AM, isaku.yamahata@gmail.com wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Omit HPET AML if the HPET is disabled, QEMU is not emulating it and the
> guest may get confused by seeing HPET in the ACPI tables without a
> "physical" device present.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  hw/i386/acpi-build.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


