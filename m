Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18124338DD7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:55:59 +0100 (CET)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhKg-0005kq-61
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKhJb-0005A1-1U
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKhJX-0001bh-P0
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615553685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ve+fm2WsIGjtcb18cW67XKZIFimtyWa/pXlDls1FpN0=;
 b=C6K70CZnLwdWt8aLVzCrJPtkdWN3V15tMLF4jomPt8otiD4qhwV7iRxGKTBTpnAOXFABbp
 YkjAzLmuZl7/6TjHbJNkslSFyTmOSex1IsttrA2cdP1RdSBeBcQKonH4SQro4YnqrmVKtS
 oR9YJADd0fNrlMTHepQ96HMQLVDONg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-TOXPdz5dP360ZWFyEuvLlQ-1; Fri, 12 Mar 2021 07:54:43 -0500
X-MC-Unique: TOXPdz5dP360ZWFyEuvLlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D5B1101F002
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 12:54:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D80B05C1D1;
 Fri, 12 Mar 2021 12:54:37 +0000 (UTC)
Subject: Re: [PATCH 24/26] qom: introduce object_property_help()
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
 <20200110153039.1379601-25-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c3bbad37-410a-6f6a-c0e0-f0c1ea10e0a4@redhat.com>
Date: Fri, 12 Mar 2021 13:54:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20200110153039.1379601-25-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2020 16.30, Marc-André Lureau wrote:
> Let's factor out the code to format a help string for a property. We
> are going to reuse it in qdev next, which will bring some consistency.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/qom/object.h    | 13 +++++++++++++
>   qom/object_interfaces.c | 39 +++++++++++++++++++++++----------------
>   2 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 933e5c6cb9..a28e37a648 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1854,6 +1854,19 @@ Object *container_get(Object *root, const char *path);
>    */
>   size_t object_type_get_instance_size(const char *typename);
>   
> +/**
> + * object_property_help:
> + * @name: the name of the property
> + * @type: the type of the property
> + * @defval: the default value
> + * @description: description of the property
> + *
> + * Returns: a user-friendly formatted string describing the property
> + * for help purposes.
> + */
> +char *object_property_help(const char *name, const char *type,
> +                           const char *defval, const char *description);
> +
>   G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
>   
>   #endif
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index edb4cc4a3d..b7157d6ab0 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -158,6 +158,25 @@ int user_creatable_add_opts_foreach(void *opaque, QemuOpts *opts, Error **errp)
>       return 0;
>   }
>   
> +char *object_property_help(const char *name, const char *type,
> +                           const char *defval, const char *description)
> +{
> +    GString *str = g_string_new(NULL);
> +
> +    g_string_append_printf(str, "  %s=<%s>", name, type);
> +    if (defval) {
> +        g_string_append_printf(str, " (default: %s)", defval);
> +    }

  Hi!

There is something weird going on wit the default value text...

When I run:

$ qemu-system-x86_64 -device isa-fdc,help

I get:

isa-fdc options:
   bootindexA=<int32>
   bootindexB=<int32>
   dma=<uint32>           -  (default: (null))
   driveA=<str>           - Node name or ID of a block device to use as a backend
   driveB=<str>           - Node name or ID of a block device to use as a backend
   fallback=<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default: (null))
   fdtypeA=<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default: (null))
   fdtypeB=<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default: (null))
   iobase=<uint32>        -  (default: (null))
   irq=<uint32>           -  (default: (null))

Why is it showing "(null)" as default values?

  Thomas


