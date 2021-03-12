Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9233872E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:18:14 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKczt-0007pO-9w
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKcy7-0006QH-SR
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKcy1-0005Pw-Fi
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615536976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djhwfvanJrQsHYbs1FX23KzOT+bFXFonPYugzWeOyzk=;
 b=Oj1ITsoCiUUmvMAsV7czfHEhsQDXo4QNiTbHJh4LdaP1IlOR92N6YTQ8BbGo9QBHhEFAB/
 JoAGtHyhagb35U7wy5zlTf+QBu2yBM3oozVGXqrU/zOOWH6o34UCERA6XIJDT1VuxbJSY/
 AQsPL6/7giJ+60jlVujVV1awh1ASOOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-nt9enLupNaOokk7YQD4YrA-1; Fri, 12 Mar 2021 03:16:13 -0500
X-MC-Unique: nt9enLupNaOokk7YQD4YrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5037E5760;
 Fri, 12 Mar 2021 08:16:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7DF19C47;
 Fri, 12 Mar 2021 08:16:02 +0000 (UTC)
Subject: Re: [PATCH 2/6] tests/qtest: Add qtest_probe_accel() method
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8814a4d5-f26d-3645-4e64-eb5b8f8bf973@redhat.com>
Date: Fri, 12 Mar 2021 09:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 00.11, Philippe Mathieu-Daudé wrote:
> Introduce the qtest_probe_accel() method which allows
> to query at runtime if a QEMU instance has an accelerator
> built-in.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h |  9 +++++++++
>   tests/qtest/libqtest.c        | 24 ++++++++++++++++++++++++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index a68dcd79d44..ebedb82ec98 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -763,6 +763,15 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
>    */
>   bool qtest_probe_child(QTestState *s);
>   
> +/**
> + * qtest_probe_accel:
> + * @s: QTestState instance to operate on.
> + * @name: Accelerator name to check for.
> + *
> + * Returns: true if the accelerator is built in.
> + */
> +bool qtest_probe_accel(QTestState *s, const char *name);

Maybe better qtest_has_accel() ? ... that makes it clear right from the 
start what the return type is about.

>   /**
>    * qtest_set_expected_status:
>    * @s: QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 71e359efcd3..57e7e55b9cc 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -872,6 +872,30 @@ void qtest_qmp_eventwait(QTestState *s, const char *event)
>       qobject_unref(response);
>   }
>   
> +bool qtest_probe_accel(QTestState *s, const char *name)
> +{
> +    bool has_accel = false;
> +    QDict *response;
> +    QList *accels;
> +    QListEntry *accel;
> +
> +    response = qtest_qmp(s, "{'execute': 'query-accels'}");
> +    accels = qdict_get_qlist(response, "return");
> +
> +    QLIST_FOREACH_ENTRY(accels, accel) {
> +        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
> +        const char *accel_name = qdict_get_str(accel_dict, "name");
> +
> +        if (!strcmp(name, accel_name)) {

I'd prefer g_str_equal() ... that's easier to read.

> +            has_accel = true;
> +            break;
> +        }
> +    }
> +    qobject_unref(response);
> +
> +    return has_accel;
> +}
> +
>   char *qtest_vhmp(QTestState *s, const char *fmt, va_list ap)
>   {
>       char *cmd;
> 

  Thomas


