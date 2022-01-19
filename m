Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52189493CC7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:17:03 +0100 (CET)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAChp-0001N9-Ro
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nABdQ-00088j-0C
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nABdM-000351-1N
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642601298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPX7dEGt809TC4Yt8Sa0BG+awpzGBVm+ThJ6pPxsDEk=;
 b=TR4/SKclVQ6rRXyp8smNf+VlOJ/0i4JmNRpFPrdGR0MQNLZAQOnVTUcBTVBedHlx+N4rvN
 yuln6ydwnfdli5Y49tnocVse9Ep5saWqgl79Drwe18hkGaI/EaUnCgltfGPpsG/X8ATw4q
 Tz9Lau1Dv9IRM2q/F+aUsFVBnG2ASMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-MntMEn8GONazPPz05WMsjg-1; Wed, 19 Jan 2022 09:08:14 -0500
X-MC-Unique: MntMEn8GONazPPz05WMsjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C2B1054F91;
 Wed, 19 Jan 2022 14:08:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF6F7E22E;
 Wed, 19 Jan 2022 14:08:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0935E113865F; Wed, 19 Jan 2022 15:08:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: MkfsSion <mkfssion@mkfssion.com>
Subject: Re: [PATCH v2] vl: Add support to set properties when using JSON
 syntax for -device via -set option
References: <20211224072511.63894-1-mkfssion@mkfssion.com>
Date: Wed, 19 Jan 2022 15:08:11 +0100
In-Reply-To: <20211224072511.63894-1-mkfssion@mkfssion.com>
 (mkfssion@mkfssion.com's message of "Wed, 29 Dec 2021 14:44:21 +0800")
Message-ID: <87iluflsxg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MkfsSion <mkfssion@mkfssion.com> writes:

> When using JSON syntax for -device, -set option can not find device
> specified in JSON by id field. The following commandline is an example:
>
> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined
>
> The patch fixes the above issue by trying to convert value provided by -set
> option to the type that the setting property actually takes.
>
> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>  v2:
>      1.Set device option when group is 'device' only
>      2.Store value in type that properties actually take

2. is an attempt to fix the issue I pointed out in review of v1
(example output corrected in places):

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

    [...]

    Example:

        $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
        qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0"}: Invalid parameter type for 'serial', expected: string

    I can't see how -set can store the right thing.

See code below.

    Aside: the error messages refer to -device instead of -set.  Known bug
    in -set, hard to fix.

>
>
>  softmmu/vl.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1367..c213e9e022 100644
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
> @@ -2274,6 +2276,61 @@ static void qemu_read_default_config_file(Error **errp)
>      }
>  }
>  
> +static bool qemu_set_device_option_property(const char *id, const char *key,
> +                                            const char *value, Error **errp) {
> +    DeviceOption *opt;
> +    QTAILQ_FOREACH(opt, &device_opts, next) {
> +        const char *device_id = qdict_get_try_str(opt->opts, "id");
> +        if (device_id && (strcmp(device_id, id) == 0)) {
> +            QObject *obj = NULL;
> +            if ((strcmp(key, "id") == 0) ||
> +                (strcmp(key, "bus") == 0) ||
> +                (strcmp(key, "driver") == 0)) {
> +                obj = QOBJECT(qstring_from_str(value));

Special case, because these are not QOM properties.  Similarly
special-cased in qdev_device_add_from_qdict().  Okay.

> +            } else {
> +                const char *driver = qdict_get_try_str(opt->opts, "driver");
> +                if (driver) {
> +                    ObjectClass *klass = object_class_by_name(driver);

This may fail.

> +                    ObjectProperty *prop = object_class_property_find(klass, key);

If it does, this crashes:

    $ qemu-system-x86_64 -nodefaults -S -display none -device '{"driver": "nonexistent", "id": "foo"}' -set device.foo.bar=42
    Segmentation fault (core dumped)

> +                    if (prop) {
> +                        if (strcmp(prop->type, "str") == 0) {
> +                            obj = QOBJECT(qstring_from_str(value));
> +                        } else if (strcmp(prop->type, "bool") == 0) {
> +                            bool boolean;
> +                            if (qapi_bool_parse(key, value, &boolean, errp)) {
> +                                obj = QOBJECT(qbool_from_bool(boolean));
> +                            }
> +                        } else if (strncmp(prop->type, "uint", 4) == 0) {
> +                            uint64_t num;
> +                            if (parse_option_size(key, value, &num, errp)) {
> +                                obj = QOBJECT(qnum_from_uint(num));
> +                            }
> +                        } else {
> +                            error_setg(errp,
> +                                       "Setting property %s on device %s with "
> +                                       "type %s is unsupported via -set option",
> +                                       key, id, prop->type);
> +                        }

This guesses based on prop->type.  Unfortunately, its values are a mess.
They are documented in qom.json:

    # @type: the type of the property.  This will typically come in one of four
    #        forms:
    #
    #        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'double'.
    #           These types are mapped to the appropriate JSON type.
    #
    #        2) A child type in the form 'child<subtype>' where subtype is a qdev
    #           device type name.  Child properties create the composition tree.
    #
    #        3) A link type in the form 'link<subtype>' where subtype is a qdev
    #           device type name.  Link properties form the device model graph.

I like that it says "one of four", then lists three.  Fair warning to
the reader not to trust this.

In fact, 1) is aspirational.  The value is whatever C code passes to
object_property_add().  Actually values include "bool", "int", "int32",
"size", "string", "uint16", "uint32", "uint64", "uint8",
"GuestPanicInformation", "QemuUUID", "X86CPUFeatureWordInfo", my
favorites "container", "guest statistics", "struct tm", and my special
favorite "struct".

Your code recognizes only some values we actually use.  Even if it
recognized all, keeping it that way would be an impossible mission.

It parses (unsigned) integers with parse_option_size().  Apropriate only
sometimes.

The patch covers only -device.  We've extended more options from just
QemuOpts (where -set works) to also JSON (where it doesn't),
e.g. -object.  More to come.

This is more elaborate guesswork than v1, but it's still guesswork, and
still incomplete.

I don't think we should try to make -set work when using JSON arguments.


> +                    } else {
> +                        error_setg(errp, "Unable to find property %s on device %s",
> +                                   key, id);
> +                    }
> +                } else {
> +                    error_setg(errp, "Unable to get driver for device %s", id);

Masks the real error.

    $ qemu-system-x86_64 -nodefaults -S -display none -device '{"id": "foo"}' -set device.foo.bar=42
    qemu-system-x86_64: -set device.foo.bar=42: Unable to get driver for device foo

    $ qemu-system-x86_64 -nodefaults -S -display none -device '{"id": "foo"}'
    qemu-system-x86_64: -device {"id": "foo"}: Parameter 'driver' is missing

> +                }
> +            }
> +            if (obj) {
> +                qdict_del(opt->opts, key);
> +                qdict_put_obj(opt->opts, key, obj);
> +                return true;
> +            } else {
> +                return false;
> +            }
> +        }
> +    }
> +    return false;
> +}
> +
>  static void qemu_set_option(const char *str, Error **errp)
>  {
>      char group[64], id[64], arg[64];
> @@ -2294,6 +2351,11 @@ static void qemu_set_option(const char *str, Error **errp)
>          if (list) {
>              opts = qemu_opts_find(list, id);
>              if (!opts) {
> +                if (strcmp(group, "device") == 0) {
> +                    if (qemu_set_device_option_property(id, arg,
> +                                                        str + offset + 1, errp))
> +                        return;
> +                }
>                  error_setg(errp, "there is no %s \"%s\" defined", group, id);
>                  return;
>              }


