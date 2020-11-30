Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFF2C860E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:58:33 +0100 (CET)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjhI-0006G5-1R
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjjfL-0004xb-N6
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:56:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:49152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjjfJ-0005bk-Qr
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:56:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD485ABD2;
 Mon, 30 Nov 2020 13:56:20 +0000 (UTC)
Subject: Re: [PATCH] qom: eliminate identical functions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201130123708.3442032-1-pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <89991778-8adb-b5e8-76a3-730a5edfdd90@suse.de>
Date: Mon, 30 Nov 2020 14:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201130123708.3442032-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/30/20 1:37 PM, Paolo Bonzini wrote:
> Most property release functions in qom/object.c only free the opaque
> value.  Combine all of them into a single function.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I noticed also a bunch of unused defines in qom,

OBJECT_DEFINE_... not all of them are really used..

Ciao,

Claudio
> ---
>  qom/object.c | 36 +++++++-----------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 1065355233..75a78c9343 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2174,11 +2174,10 @@ static void property_set_str(Object *obj, Visitor *v, const char *name,
>      g_free(value);
>  }
>  
> -static void property_release_str(Object *obj, const char *name,
> -                                 void *opaque)
> +static void property_release_data(Object *obj, const char *name,
> +                                  void *opaque)
>  {
> -    StringProperty *prop = opaque;
> -    g_free(prop);
> +    g_free(opaque);
>  }
>  
>  ObjectProperty *
> @@ -2194,7 +2193,7 @@ object_property_add_str(Object *obj, const char *name,
>      return object_property_add(obj, name, "string",
>                                 get ? property_get_str : NULL,
>                                 set ? property_set_str : NULL,
> -                               property_release_str,
> +                               property_release_data,
>                                 prop);
>  }
>  
> @@ -2251,13 +2250,6 @@ static void property_set_bool(Object *obj, Visitor *v, const char *name,
>      prop->set(obj, value, errp);
>  }
>  
> -static void property_release_bool(Object *obj, const char *name,
> -                                  void *opaque)
> -{
> -    BoolProperty *prop = opaque;
> -    g_free(prop);
> -}
> -
>  ObjectProperty *
>  object_property_add_bool(Object *obj, const char *name,
>                           bool (*get)(Object *, Error **),
> @@ -2271,7 +2263,7 @@ object_property_add_bool(Object *obj, const char *name,
>      return object_property_add(obj, name, "bool",
>                                 get ? property_get_bool : NULL,
>                                 set ? property_set_bool : NULL,
> -                               property_release_bool,
> +                               property_release_data,
>                                 prop);
>  }
>  
> @@ -2320,13 +2312,6 @@ static void property_set_enum(Object *obj, Visitor *v, const char *name,
>      prop->set(obj, value, errp);
>  }
>  
> -static void property_release_enum(Object *obj, const char *name,
> -                                  void *opaque)
> -{
> -    EnumProperty *prop = opaque;
> -    g_free(prop);
> -}
> -
>  ObjectProperty *
>  object_property_add_enum(Object *obj, const char *name,
>                           const char *typename,
> @@ -2343,7 +2328,7 @@ object_property_add_enum(Object *obj, const char *name,
>      return object_property_add(obj, name, typename,
>                                 get ? property_get_enum : NULL,
>                                 set ? property_set_enum : NULL,
> -                               property_release_enum,
> +                               property_release_data,
>                                 prop);
>  }
>  
> @@ -2410,13 +2395,6 @@ out_end:
>      visit_end_struct(v, NULL);
>  }
>  
> -static void property_release_tm(Object *obj, const char *name,
> -                                void *opaque)
> -{
> -    TMProperty *prop = opaque;
> -    g_free(prop);
> -}
> -
>  ObjectProperty *
>  object_property_add_tm(Object *obj, const char *name,
>                         void (*get)(Object *, struct tm *, Error **))
> @@ -2427,7 +2405,7 @@ object_property_add_tm(Object *obj, const char *name,
>  
>      return object_property_add(obj, name, "struct tm",
>                                 get ? property_get_tm : NULL, NULL,
> -                               property_release_tm,
> +                               property_release_data,
>                                 prop);
>  }
>  
> 


