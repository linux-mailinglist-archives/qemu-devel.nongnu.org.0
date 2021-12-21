Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6447BEED
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:29:35 +0100 (CET)
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdKo-0000n0-1f
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzdIB-0006zR-VA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzdI7-0008Br-G1
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640086006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cyLOX2VyJt8mTvQ5oZI7R0eUNEWIvVndzUU5VvNAtG8=;
 b=BNMFA5hh3QoYN1WzXH4hgwc+XFF52VdSMnZ0/SiNzB3V/uyVN7EqWCiKt1U3fa5BMW+9CM
 gy+hCIRmzd2dEAtFGIZxY4G/zQ46hV9uI9c6ihlb5XN5l9bXtP6xEzrt2Nj+rGB3DDsbJF
 Fm4R9BLMrXywvcdFbQ6ulR5TsBMo5Mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-C_u9nIbDMYGlvU3YvoKDmQ-1; Tue, 21 Dec 2021 06:26:45 -0500
X-MC-Unique: C_u9nIbDMYGlvU3YvoKDmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE17A81CCB4;
 Tue, 21 Dec 2021 11:26:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 832A65E49F;
 Tue, 21 Dec 2021 11:26:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D670113865F; Tue, 21 Dec 2021 12:26:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: MkfsSion <mkfssion@mkfssion.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using
 JSON syntax for -device
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
Date: Tue, 21 Dec 2021 12:26:42 +0100
In-Reply-To: <20211221071818.34731-1-mkfssion@mkfssion.com>
 (mkfssion@mkfssion.com's message of "Tue, 21 Dec 2021 15:18:18 +0800")
Message-ID: <877dbyjj0t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MkfsSion <mkfssion@mkfssion.com> writes:

> When using JSON syntax for -device, -set option can not find device
> specified in JSON by id field. The following commandline is an example:
>
> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined

Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
syntax for -device" (v6.2.0).

I believe any conversion away from QemuOpts loses -set.

> The patch adds -set options to JSON device opts dict for adding
> options to device by latter object_set_properties_from_keyval call.
>
> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>  include/qemu/option.h |  4 ++++
>  softmmu/vl.c          | 28 ++++++++++++++++++++++++++++
>  util/qemu-option.c    |  2 +-
>  3 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/include/qemu/option.h b/include/qemu/option.h
> index 306bf07575..31fa9fdc25 100644
> --- a/include/qemu/option.h
> +++ b/include/qemu/option.h
> @@ -45,6 +45,10 @@ const char *get_opt_value(const char *p, char **value);
>  
>  bool parse_option_size(const char *name, const char *value,
>                         uint64_t *ret, Error **errp);
> +
> +bool parse_option_number(const char *name, const char *value,
> +                         uint64_t *ret, Error **errp);
> +
>  bool has_help_option(const char *param);
>  
>  enum QemuOptType {
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1367..feb3c49a65 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -30,7 +30,9 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/compat-policy.h"
>  #include "qapi/error.h"
> +#include "qapi/qmp/qbool.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qnum.h"
>  #include "qapi/qmp/qstring.h"
>  #include "qapi/qmp/qjson.h"
>  #include "qemu-version.h"
> @@ -2279,6 +2281,7 @@ static void qemu_set_option(const char *str, Error **errp)
>      char group[64], id[64], arg[64];
>      QemuOptsList *list;
>      QemuOpts *opts;
> +    DeviceOption *opt;
>      int rc, offset;
>  
>      rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
> @@ -2294,6 +2297,31 @@ static void qemu_set_option(const char *str, Error **errp)
>          if (list) {
>              opts = qemu_opts_find(list, id);
>              if (!opts) {
> +                QTAILQ_FOREACH(opt, &device_opts, next) {
> +                    const char *device_id = qdict_get_try_str(opt->opts, "id");
> +                    if (device_id && (strcmp(device_id, id) == 0)) {
> +                        if (qdict_get(opt->opts, arg)) {
> +                            qdict_del(opt->opts, arg);
> +                        }
> +                        const char *value = str + offset + 1;
> +                        QObject *obj = NULL;
> +                        bool boolean;
> +                        uint64_t num;
> +                        if (qapi_bool_parse(arg, value, &boolean, NULL)) {
> +                            obj = QOBJECT(qbool_from_bool(boolean));
> +                        } else if (parse_option_number(arg, value, &num, NULL)) {
> +                            obj = QOBJECT(qnum_from_uint(num));
> +                        } else if (parse_option_size(arg, value, &num, NULL)) {
> +                            obj = QOBJECT(qnum_from_uint(num));
> +                        } else {
> +                            obj = QOBJECT(qstring_from_str(value));
> +                        }
> +                        if (obj) {
> +                            qdict_put_obj(opt->opts, arg, obj);
> +                            return;
> +                        }
> +                    }
> +                }
>                  error_setg(errp, "there is no %s \"%s\" defined", group, id);
>                  return;
>              }
               qemu_opt_set(opts, arg, str + offset + 1, errp);
           }
       }
   }

Two issues, and only looks fixable.

-device accepts either a QemuOpts or a JSON argument.

It parses the former with qemu_opts_parse_noisily() into a QemuOpt
stored in @qemu_device_opts.

It parses the latter with qobject_from_json() into a QObject stored in
@device_opts.  Yes, the names are confusing.

-set parses its argument into @group, @id, and @arg (the value).

Before the patch, it uses @group and @id to look up the QemuOpt in
@qemu_device_opts.  If found, it updates it with qemu_opt_set().

By design, -set operates on the QemuOpts store.

Options stored in @device_opts are not found.  Your patch tries to fix
that.  Before I can explain what's wrong with it, I need more
background.

QemuOpts arguments are parsed as a set of (key, value) pairs, where the
values are all strings (because qemu_device_opts.desc[] is empty).  We
access them with a qobject_input_visitor_new_keyval() visitor.  This
parses the strings according to the types being visited.

Example: key=42 gets stored as {"key": "42"}.  If we visit it with
visit_type_str(), we use string value "42".  If we visit it with
visit_type_int() or similar, we use integer value 42.  If we visit it
with visit_type_number(), we use double value 42.0.  If we visit it with
something else, we error out.

JSON arguments are parsed as arbitrary JSON object.  We access them with
a qobject_input_visitor_new() visitor.  This expects the values to have
JSON types appropriate for the types being visited.

Example: {"key": "42"} gets stored as is.  Now everything but
visit_type_str() errors out.

Back to your patch.  It adds code to look up a QObject in @device_opts.
If found, it updates it.

Issue#1: it does so regardless of @group.

Example:

    $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set chardev.ms0.serial=456

Here, -set chardev... gets misinterpreted as -set device...

Issue#2 is the value to store in @device_opts.  Always storing a string,
like in the QemuOpts case, would be wrong, because it works only when
its accessed with visit_type_str(), i.e. the property is actually of
string type.

Example:

    $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123

    $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.msos-desc=off
    qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0"}: Invalid parameter type for 'msos-desc', expected: boolean

Your patch stores a boolean if possible, else a number if possible, else
a string.  This is differently wrong.

Example:

    $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}'

Example:

    $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
    qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0", "serial": "123"}: Invalid parameter type for 'serial', expected: string

I can't see how -set can store the right thing.

Aside: the error messages refer to -device instead of -set.  Known bug
in -set, hard to fix.

> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index eedd08929b..b2427cba9f 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -88,7 +88,7 @@ const char *get_opt_value(const char *p, char **value)
>      return offset;
>  }
>  
> -static bool parse_option_number(const char *name, const char *value,
> +bool parse_option_number(const char *name, const char *value,
>                                  uint64_t *ret, Error **errp)
>  {
>      uint64_t number;


