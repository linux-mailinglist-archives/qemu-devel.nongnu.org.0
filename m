Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC33A1BC6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:28:43 +0200 (CEST)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr20Q-0003nL-Fe
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr1zM-00036h-0T
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr1zK-0001Hk-6y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623259653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6D/sstWND1cChm8U1YN6XyWXMGwX6zuEsunN2FDow4w=;
 b=Mpk9/6ebSJi/VYILNCcVfciMCRfaC8pmYut8QVhhMwyW5KyBsaWqnqzpWUTKxayn5G3S07
 N5c2z6M79BkEs/DXoQIsvrFFh/9Vv4LXE0m1vsamAH4BbKMo+TBeRx8WK8AplBkyyp8ljt
 7CPFrQzV35EIdppWc7u75DXLmAny7Z0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-kNRP1GZKNs2juC96tSWupw-1; Wed, 09 Jun 2021 13:27:32 -0400
X-MC-Unique: kNRP1GZKNs2juC96tSWupw-1
Received: by mail-wr1-f71.google.com with SMTP id
 z13-20020adfec8d0000b0290114cc6b21c4so10991218wrn.22
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6D/sstWND1cChm8U1YN6XyWXMGwX6zuEsunN2FDow4w=;
 b=eYyl+YdGQSEyh/Be4UQx8Q6iemQMj/cubMb0bt2w0qef3oK8uSkug4arG1yYLdqIgr
 byjBn1K7lsBU6KAH2UpIQESVs3JEgDKGrOez9kVnK1cSuEtFt+b6JxyGydgK1L5Mso2O
 bcmFemZxCSW6NZVeAVF5MR7btotbmgt4ZfsKTYu4YqddEOmV7dPEoBkRlZ9h4wGgxRFO
 HXCtcag2rBZ0I55q53/yBtqYd+jKoQY5MBxH4uiHv1at2nhCzV/4a6GJt3+m3cnij70h
 rhjlMTpsrfcFPzgyL8RCpBviaVhOqeoDERYNer9sDI9/cZax6qPlxi86uNAGZmoBpHQX
 65jA==
X-Gm-Message-State: AOAM533ve3tHoDO19sz17hi1gBslRDVlgnGqmWwBzOuEkIwRmjheGlk2
 j+hInL0gAXtD/4zycaOaVdo31A+rcW12Dmde1/b5YE22Sj+JD3c5to03txXwVKAEvLJgk9ysD/l
 Ktv9hJWFZWwx5J3E=
X-Received: by 2002:adf:dec3:: with SMTP id i3mr956936wrn.190.1623259650919;
 Wed, 09 Jun 2021 10:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRaYi+4ixxEkuMI6IQu2uPP15SDB+Df3JCB0NKU94RhKQRbvP2vG37vqKZbTu7AyqDcQMhIw==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr956919wrn.190.1623259650686;
 Wed, 09 Jun 2021 10:27:30 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id x20sm395429wmc.39.2021.06.09.10.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:27:30 -0700 (PDT)
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210609152559.1088596-1-philmd@redhat.com>
 <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
Date: Wed, 9 Jun 2021 19:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 6:01 PM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
> 
>     When the management layer queries a binary built using --disable-tpm
>     for TPM devices, it gets confused by getting empty responses:
> 
>       { "execute": "query-tpm" }
>       {
>           "return": [
>           ]
>       }
>       { "execute": "query-tpm-types" }
>       {
>           "return": [
>           ]
>       }
>       { "execute": "query-tpm-models" }
>       {
>           "return": [
>           ]
>       }
> 
>     Make it clearer by returning an error, mentioning the feature is
>     disabled:
> 
>       { "execute": "query-tpm" }
>       {
>           "error": {
>               "class": "GenericError",
>               "desc": "this feature or command is not currently supported"
>           }
>       }
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
> 
> 
> Why not make the qapi schema conditional?

I'm getting:

qapi/qapi-commands-tpm.c:123:13: error: ‘qmp_marshal_output_TPMInfoList’
defined but not used [-Werror=unused-function]
  123 | static void qmp_marshal_output_TPMInfoList(TPMInfoList *ret_in,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qapi/qapi-commands-tpm.c:73:13: error: ‘qmp_marshal_output_TpmTypeList’
defined but not used [-Werror=unused-function]
   73 | static void qmp_marshal_output_TpmTypeList(TpmTypeList *ret_in,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qapi/qapi-commands-tpm.c:23:13: error: ‘qmp_marshal_output_TpmModelList’
defined but not used [-Werror=unused-function]
   23 | static void qmp_marshal_output_TpmModelList(TpmModelList *ret_in,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Fixed doing:

-- >8 --
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 0e13d510547..85e332a5979 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -91,6 +91,7 @@ def gen_call(name: str,
 def gen_marshal_output(ret_type: QAPISchemaType) -> str:
     return mcgen('''

+__attribute__((unused))
 static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
                                 QObject **ret_out, Error **errp)
 {
---

But I doubt this is correct... I suppose gen_marshal_output() should
be elided if no command use the type? The enum is used however:

include/sysemu/tpm.h-37-struct TPMIfClass {
include/sysemu/tpm.h-38-    InterfaceClass parent_class;
include/sysemu/tpm.h-39-
include/sysemu/tpm.h:40:    enum TpmModel model;
include/sysemu/tpm.h-41-    void (*request_completed)(TPMIf *obj, int ret);
include/sysemu/tpm.h-42-    enum TPMVersion (*get_version)(TPMIf *obj);
include/sysemu/tpm.h-43-};
include/sysemu/tpm.h-44-


