Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C103A2854
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:35:13 +0200 (CEST)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrH5k-0000nO-2D
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH4L-00004r-AS
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:33:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH4H-00083L-1r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623317620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL2XE3H23oC75aTGjoc9hImlTh/k+icgOI1s79O9r38=;
 b=SfGyfkD1wfhm021d45q+xlP8yrQOGM0pfyArzArXZpOMl+cI4K4oTOo9E/W1tGu12OARMF
 Cdvq+xgAyhuvDrUAy3DOwIOhJsb+s+O8oOzrsUbO8zBs6AAZfQsQxvxG3AIJH6fQCXaMIx
 OkBuYxCKlpEE9Tgur84f55/Zhi+gdK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-RARMSCavOZy5VlQckSi4tA-1; Thu, 10 Jun 2021 05:33:37 -0400
X-MC-Unique: RARMSCavOZy5VlQckSi4tA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416D38015A4;
 Thu, 10 Jun 2021 09:33:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1161260853;
 Thu, 10 Jun 2021 09:33:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F7D8113865F; Thu, 10 Jun 2021 11:33:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-2-philmd@redhat.com>
 <20210609202952.r4nb2smrptyckvk2@redhat.com>
Date: Thu, 10 Jun 2021 11:33:34 +0200
In-Reply-To: <20210609202952.r4nb2smrptyckvk2@redhat.com> (Eric Blake's
 message of "Wed, 9 Jun 2021 15:29:52 -0500")
Message-ID: <87eedadpxt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Wed, Jun 09, 2021 at 08:49:54PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> In case we need to use QAPI types but no QAPI command / QAPI event
>> actually use them, the generated qmp_marshal_output() function will
>> trigger the compiler 'unused-function' warnings.
>> To prevent that, emit these functions inlined: the compiler will
>> ignore such unused functions.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> RFC: No clue about QAPI...
>> Tested with GCC. If the compiler is picky we could use the 'unused'
>> function attribute.
>
> And I have no clue if clang will warn about an unused inline function.
> Going with the compiler attribute seems safer and just as easy to do
> in the same two-line change (remember, the "unused" attribute merely
> means "suppress warnings if I don't use this", and not "warn me if I
> use it in spite of calling it unused").
>
>> ---
>>  scripts/qapi/commands.py | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 0e13d510547..bbed776a909 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
>> @@ -91,8 +91,8 @@ def gen_call(name: str,
>>  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>>      return mcgen('''
>> =20
>> -static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>> -                                QObject **ret_out, Error **errp)
>> +static inline void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>> +                                        QObject **ret_out, Error **errp=
)
>
> On the other hand, the qapi generator is smart enough to only output
> introspection data for qapi types that were actually used by a command
> or event, so how is that working, and why is it not also being used to
> elide the generation of unused qmp_marshal_output_FOO functions?  This
> is where I'll have to defer to Markus.

This is a QAPI generator restriction.  Let me explain.

The qmp_marshal_output_T() are shared by all commands returning T.

The commands may be conditional.  The user is responsible for making T's
'if' the conjunction of the commands'.  See the FIXME in commands.py.

If I do this for tpm.json (appended), then tpm.h misses TpmModel when
CONFIG_TPM is off, and tpm_backend.h misses TpmType and TpmInfo.  I
suspect more TPM code needs to be guarded by CONFIG_TPM.



diff --git a/qapi/tpm.json b/qapi/tpm.json
index 09332e6f99..e74c881ea6 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -17,7 +17,9 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
+  'if': 'defined(CONFIG_TPM)' }
+
 ##
 # @query-tpm-models:
 #
@@ -47,7 +49,8 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+  'if': 'defined(CONFIG_TPM)' }
=20
 ##
 # @query-tpm-types:
@@ -124,7 +127,8 @@
 { 'struct': 'TPMInfo',
   'data': {'id': 'str',
            'model': 'TpmModel',
-           'options': 'TpmTypeOptions' } }
+           'options': 'TpmTypeOptions' },
+  'if': 'defined(CONFIG_TPM)' }
=20
 ##
 # @query-tpm:


