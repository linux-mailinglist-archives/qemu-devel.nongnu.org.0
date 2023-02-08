Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6E68F097
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlHm-0003Lt-F6; Wed, 08 Feb 2023 09:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPlHk-0003LN-4y
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:18:56 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPlHi-0001Ed-AQ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:18:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id ba1so12845445wrb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udX9yTp9nBJLjZS9TC/O8Nt9qTy1PnAwM+dfQPy3P3M=;
 b=fbGnwGFbC6n6QCE3CahIgzrRPNCO/OJhdG3HO59ptJjrCCMtnq7ucWDXGmvet/Qt2o
 Vo3lW06rzyVSTjfoZgQtMk0VInxHFp/penwGstTGFFS3MdDURy4U0Ivjcz1Gnm99Y9PN
 xzLhEPW38lxlUh/5D0Ps+HpWf+s4CgHsVXdBt/T7eZXSPBk5jbaLGIMK5DkNjGqmPnCE
 MVNCcSR9RpymHSL5BDuD2XEkscijRK5CotuYSaYYNSijtQ3c9H59sYjSajWqzRh5dldv
 Bddj4iMs/Sp/VjeamePK5qPV5MeIO4AdE/PyQbnMs0dBYfoWNaNsu4/xEJHCV5nrZIES
 8OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=udX9yTp9nBJLjZS9TC/O8Nt9qTy1PnAwM+dfQPy3P3M=;
 b=htr0ALfLxZL0eYlepc3WHzork6Lbd+idTyKsdxVN4ZjhvBklO9j3inqmcXRU7kxL6x
 LEcor3rZ/7UHHb0I6avQAgl5+WZrJUpMl8JPgrI/CzJHWrDD408urBlMwj5pg5jp5XRm
 acJw5HIH9XPowAqteb6WpElvQeVfSWRu9q5UjX8K5ZG0sJNFdD4hyY6n+MEUsOfgfNe7
 ozUT1emPyv7cUe9Kq7tDWq78ZM5QLKbqaiIXpNY0bqRM4HHxIdGT3XZNfAhVxguYGgT/
 8jkFqHb7XCOgwWEmLHHlFxJVQsFxkpW7eI8iyteRyJI+QCc1NAjkUG+pcue1HQTqRyPE
 gZMw==
X-Gm-Message-State: AO0yUKVcdYiGDDOFTWyA3yDNu/XveSFLtmi6smA3KJghQD9qhh5bio39
 s6DSL3UcIhyJ9eJcJhLUaEirwg==
X-Google-Smtp-Source: AK7set9XHA9FDXBkC7Bp0Q+HJAM7jK+D2rgQ1OkNN1hrglvrPjdT7/6OqdxHdr39yF9vqkDDkKw0Pg==
X-Received: by 2002:a5d:5703:0:b0:2c3:bc42:3008 with SMTP id
 a3-20020a5d5703000000b002c3bc423008mr1925746wrv.42.1675865931320; 
 Wed, 08 Feb 2023 06:18:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q8-20020adfea08000000b002c3ddcf4f3asm11094003wrm.0.2023.02.08.06.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:18:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 634D71FFB7;
 Wed,  8 Feb 2023 14:18:50 +0000 (GMT)
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>, "Dr.
 David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Date: Wed, 08 Feb 2023 14:17:54 +0000
In-reply-to: <32f34f74-213d-7107-907d-dda0a509878e@oracle.com>
Message-ID: <87h6vwnstx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Steven Sistare <steven.sistare@oracle.com> writes:

> On 2/8/2023 1:43 AM, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>=20
>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com=
> wrote:
>>>
>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>> as strList_from_string(), and move it to qapi/util.c.
>>>
>>> No functional change.
>>=20
>> The g_strsplit() version was a bit simpler, but if you want to
>> optimize it a bit for 1 char delimiter only, ok.
>>=20
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Yes, and it saves a malloc+free for the array.  Small stuff, but I
> thought it worth a few lines of code.  Thanks for the speedy review!

But is the HMP path that performance critical? Otherwise I'd favour
consistent use of the glib APIs because its one less thing to get wrong.

>
> - Steve
>
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> ---
>>>  include/monitor/hmp.h  |  1 -
>>>  include/qapi/util.h    |  9 +++++++++
>>>  monitor/hmp-cmds.c     | 19 -------------------
>>>  net/net-hmp-cmds.c     |  2 +-
>>>  qapi/qapi-util.c       | 23 +++++++++++++++++++++++
>>>  stats/stats-hmp-cmds.c |  2 +-
>>>  6 files changed, 34 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>>> index 2220f14..e80848f 100644
>>> --- a/include/monitor/hmp.h
>>> +++ b/include/monitor/hmp.h
>>> @@ -19,7 +19,6 @@
>>>
>>>  bool hmp_handle_error(Monitor *mon, Error *err);
>>>  void hmp_help_cmd(Monitor *mon, const char *name);
>>> -strList *hmp_split_at_comma(const char *str);
>>>
>>>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>>>  void hmp_info_version(Monitor *mon, const QDict *qdict);
>>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>>> index 81a2b13..7d88b09 100644
>>> --- a/include/qapi/util.h
>>> +++ b/include/qapi/util.h
>>> @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>>>      const int size;
>>>  } QEnumLookup;
>>>
>>> +struct strList;
>>> +
>>>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>>>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>>>                      int def, Error **errp);
>>> @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *v=
alue, bool *obj,
>>>  int parse_qapi_name(const char *name, bool complete);
>>>
>>>  /*
>>> + * Produce a strList from the character delimited string @in.
>>> + * All strings are g_strdup'd.
>>> + * A NULL or empty input string returns NULL.
>>> + */
>>> +struct strList *strList_from_string(const char *in, char delim);
>>> +
>>> +/*
>>>   * For any GenericList @list, insert @element at the front.
>>>   *
>>>   * Note that this macro evaluates @element exactly once, so it is safe
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 34bd8c6..9665e6e 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>>>      return false;
>>>  }
>>>
>>> -/*
>>> - * Split @str at comma.
>>> - * A null @str defaults to "".
>>> - */
>>> -strList *hmp_split_at_comma(const char *str)
>>> -{
>>> -    char **split =3D g_strsplit(str ?: "", ",", -1);
>>> -    strList *res =3D NULL;
>>> -    strList **tail =3D &res;
>>> -    int i;
>>> -
>>> -    for (i =3D 0; split[i]; i++) {
>>> -        QAPI_LIST_APPEND(tail, split[i]);
>>> -    }
>>> -
>>> -    g_free(split);
>>> -    return res;
>>> -}
>>> -
>>>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>>>  {
>>>      NameInfo *info;
>>> diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
>>> index 41d326b..30422d9 100644
>>> --- a/net/net-hmp-cmds.c
>>> +++ b/net/net-hmp-cmds.c
>>> @@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdi=
ct)
>>>                                              migrate_announce_params());
>>>
>>>      qapi_free_strList(params->interfaces);
>>> -    params->interfaces =3D hmp_split_at_comma(interfaces_str);
>>> +    params->interfaces =3D strList_from_string(interfaces_str, ',');
>>>      params->has_interfaces =3D params->interfaces !=3D NULL;
>>>      params->id =3D g_strdup(id);
>>>      qmp_announce_self(params, NULL);
>>> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>>> index 63596e1..b61c73c 100644
>>> --- a/qapi/qapi-util.c
>>> +++ b/qapi/qapi-util.c
>>> @@ -15,6 +15,7 @@
>>>  #include "qapi/error.h"
>>>  #include "qemu/ctype.h"
>>>  #include "qapi/qmp/qerror.h"
>>> +#include "qapi/qapi-builtin-types.h"
>>>
>>>  CompatPolicy compat_policy;
>>>
>>> @@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
>>>      }
>>>      return p - str;
>>>  }
>>> +
>>> +strList *strList_from_string(const char *in, char delim)
>>> +{
>>> +    strList *res =3D NULL;
>>> +    strList **tail =3D &res;
>>> +
>>> +    while (in && in[0]) {
>>> +        char *next =3D strchr(in, delim);
>>> +        char *value;
>>> +
>>> +        if (next) {
>>> +            value =3D g_strndup(in, next - in);
>>> +            in =3D next + 1; /* skip the delim */
>>> +        } else {
>>> +            value =3D g_strdup(in);
>>> +            in =3D NULL;
>>> +        }
>>> +        QAPI_LIST_APPEND(tail, value);
>>> +    }
>>> +
>>> +    return res;
>>> +}
>>> diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
>>> index 531e35d..4a2adf8 100644
>>> --- a/stats/stats-hmp-cmds.c
>>> +++ b/stats/stats-hmp-cmds.c
>>> @@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target=
, const char *names,
>>>              request->provider =3D provider_idx;
>>>              if (names && !g_str_equal(names, "*")) {
>>>                  request->has_names =3D true;
>>> -                request->names =3D hmp_split_at_comma(names);
>>> +                request->names =3D strList_from_string(names, ',');
>>>              }
>>>              QAPI_LIST_PREPEND(request_list, request);
>>>          }
>>> --
>>> 1.8.3.1
>>>
>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

