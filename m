Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43C702C04
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:57:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWob-0002T5-An; Mon, 15 May 2023 07:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWo9-0002Pa-TN
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWo7-00022M-Td
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684151763;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YcXWwPkfioYBbHyoB/4ScJiYQPXELUJ0yGiAg4rYWM=;
 b=CLvV/HCEgVdiXUfFAqJsOG8VWVaadUrAf+9kZWoYu9zpDlaoyLwfy9j5lN1JSzi06eQt7/
 lg+dj3VS1WFP5DXjNn4MBYc4SKdZ36fHGGnq6A5U2FM0BeiMBYr8JLFiG7qC1oEy+lJ0Fu
 FfZ3dyp8f1o+Q/NMHCFKKB0TefO/fHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-o3oxxDEXPLu-iOON1kNfKg-1; Mon, 15 May 2023 07:56:01 -0400
X-MC-Unique: o3oxxDEXPLu-iOON1kNfKg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f509037a45so20844455e9.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684151761; x=1686743761;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YcXWwPkfioYBbHyoB/4ScJiYQPXELUJ0yGiAg4rYWM=;
 b=hmIlkcL3WArLmiP/2QI0bqa+lapWstn4ZvilJiToVhuhC4VR/LhsGpcd3AvOHAUTZ/
 xor9q4v/+ijAdTE9rWwaYqTVZO45pqeE/ofxgSaOwsnl/KyCIy9K6h3a2BP0oVwD7rYC
 mR+D07Bvy/9zEuK1NDeDCnnN9JBuwIB3OD/78FA07sizIOHFl/iXOWgsKKfGwGDnXriH
 UZQwv+m284lOiTP/IDmLsd3s0Bu0aa8s+XCztCCbu1mEALXqzxXqgpz9Q2qF1clq9noE
 YVGNvD8EG8c6cLe1c2FbDX/kd4OK0vzsEJD59TU6jmjAPnUhuzE2q6y1IAH6cyxQ7ZMz
 eBdw==
X-Gm-Message-State: AC+VfDzJi0GEukkIB1sup/dXcFpDTp7FH71UKuq8KSF5MHyKID1uNqLO
 lAN7KwbT043iMAOb7+CStNsLr89p5zAdJNiOSmD5f6flaEj3y4Jgnsng0QPyrDjv7arCbwEEyTd
 ji1cRVr2yYoZyokM=
X-Received: by 2002:a1c:7702:0:b0:3f1:8129:2c53 with SMTP id
 t2-20020a1c7702000000b003f181292c53mr25381214wmi.16.1684151760786; 
 Mon, 15 May 2023 04:56:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4it2N+Yc20jcLLP4ixsPPAkdrV84AXcvHayIR0TqQiqBnxBkgTZAF3s1eioj7rgPjioO6PBg==
X-Received: by 2002:a1c:7702:0:b0:3f1:8129:2c53 with SMTP id
 t2-20020a1c7702000000b003f181292c53mr25381188wmi.16.1684151760389; 
 Mon, 15 May 2023 04:56:00 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 u19-20020a7bc053000000b003f09d7b6e20sm36769914wmc.2.2023.05.15.04.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:55:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com,  dgilbert@redhat.com,  pbonzini@redhat.com,
 armbru@redhat.com,  eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
In-Reply-To: <5351a3e1-e2e5-9c30-431c-0ce6fff4c0c7@nutanix.com> (Het Gala's
 message of "Mon, 15 May 2023 17:15:35 +0530")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com>
 <ZGIFmofD8CPJVM/g@redhat.com>
 <5351a3e1-e2e5-9c30-431c-0ce6fff4c0c7@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 13:55:59 +0200
Message-ID: <87ttwdzu40.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
v> Just so that, there is a wider attention, I will try to address and
> discuss the comments from Daniel and Juan both here, as many of them
> seems to be overlapping. I hope that is fine with the maintainers.
>
> On 15/05/23 3:42 pm, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:
>>> This patch introduces code that can parse 'uri' string parameter and
>>> spit out 'MigrateAddress' struct. All the required migration parameters
>>> are stored in the struct.
>>>
>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>> ---
>>>   migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 61 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 0ee07802a5..a7e4e286aa 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -64,6 +64,7 @@
>>>   #include "yank_functions.h"
>>>   #include "sysemu/qtest.h"
>>>   #include "options.h"
>>> +#include "qemu/sockets.h"
>>>     static NotifierList migration_state_notifiers =3D
>>>       NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>>> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
>>>                         QAPI_CLONE(SocketAddress, address));
>>>   }
>>>   +static bool migrate_uri_parse(const char *uri,
>>> +                              MigrateAddress **channel,
>>> +                              Error **errp)
>>> +{
>>> +    Error *local_err =3D NULL;
>>> +    MigrateAddress *addrs =3D g_new0(MigrateAddress, 1);
>>> +    SocketAddress *saddr;
>>> +    InetSocketAddress *isock =3D &addrs->u.rdma;
>>> +    strList **tail =3D &addrs->u.exec.args;
>>> +
>>> +    if (strstart(uri, "exec:", NULL)) {
>>> +        addrs->transport =3D MIGRATE_TRANSPORT_EXEC;
>>> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
>>> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
>>> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
>>> +    } else if (strstart(uri, "rdma:", NULL) &&
>>> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
>>> +        addrs->transport =3D MIGRATE_TRANSPORT_RDMA;
>> I would have this as
>>
>>      } else if (strstart(uri, "rdma:", NULL)) {
>>          if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
>>              addrs->transport =3D MIGRATE_TRANSPORT_RDMA;
>> 	}
>>
>> as IMHO it is bad practice to have control pass to the next
>> else if clause when inet_parse() fails, as we know this is
>> only an RDMA addr
> Ack. I will change in the next patch.
>> Also you need to use '&local_err' not 'errp' in the inet_parse
>> call, otherwise the later code block for cleanup won't run.
>
> Yes, thanks for pointing it out Daniel. Will modify that.
>
> Also, Juan is of the opinion that we could omit 'local_error' variable
> and try to address and free the memory there itself. For ex:
>
> if (saddr =3D=3D NULL) {
> =C2=A0=C2=A0=C2=A0 qapi_free_MigrateAddress(addrs);
> =C2=A0=C2=A0=C2=A0 return false;
> }
>
> Or, Daniel, can I also define here the variables like you suggested
> down in the patch ? or is it used in some special case or I am missing
> something ?
>
> g_autoptr(MigrateAddress) addrs =3D g_new0(MigrateAddress, 1);
>
> So we would not have to worry to free MigrateAddress struct.

https://blogs.gnome.org/desrt/2015/01/30/g_autoptr/

Yes, but that only happens for the cases where you want to always remove
them.

>>> +    } else if (strstart(uri, "tcp:", NULL) ||
>>> +                strstart(uri, "unix:", NULL) ||
>>> +                strstart(uri, "vsock:", NULL) ||
>>> +                strstart(uri, "fd:", NULL)) {
>>> +        addrs->transport =3D MIGRATE_TRANSPORT_SOCKET;
>>> +        saddr =3D socket_parse(uri, &local_err);
>>> +        addrs->u.socket =3D *saddr;
>> Protect with
>>
>>     if (saddr !=3D NULL) {
>>         addrs->u.socket =3D *saddr;
>>     }
>>
>>> +    }
>>> +
>>> +    if (local_err) {
>>> +        qapi_free_MigrateAddress(addrs);
>>> +        qapi_free_SocketAddress(saddr);
>>> +        qapi_free_InetSocketAddress(isock);
>>> +        error_propagate(errp, local_err);
>>> +        return false;
>>> +    }
>>> +
>>> +    *channel =3D addrs;
>>> +    return true;
>>> +}
>>> +
>>>   static void qemu_start_incoming_migration(const char *uri, Error **er=
rp)
>>>   {
>>>       const char *p =3D NULL;
>>> +    MigrateAddress *channel =3D g_new0(MigrateAddress, 1);
>> Avoid the later 'out:' cleanup block by using:
>>
>>    g_autoptr(MigrateAddress) channel =3D g_new0(MigrateAddress, 1);
> Ack. I think this also solves the doubt raised by Juan "I wish, I
> really wish, that there was a way to free things on error". Am I right
> ?

No, that was the case where we have something like:

Thing *foo(void)
{
    OtherThing *bar =3D g_new0(OtherThing, 1)

    if (whatever) {
        goto error;
    }
    if (whatever_else) {
        goto error;
    }
    return bar;
error:
    g_free(bad);
    return NULL;
}

See, we have to put the goto because we have to free it in all error
paths.  Not in the non-error path.

If it is a pure local variable, i.e. never used after the function
finishes, then g_autoptr is the right thing to do.

Later, Juan.


