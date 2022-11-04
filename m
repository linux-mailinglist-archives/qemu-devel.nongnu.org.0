Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEF618FA6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqoha-0005Cb-CJ; Fri, 04 Nov 2022 00:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqohY-0005CU-9T
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqohW-00008n-TW
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667537585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+1/yLMqN0VJonc5zni8ZO5gxOJ6l1fYzHOkFD7nkh4=;
 b=DO7G/iLA1pFq5lPO2DcJKwcSS4bRvO2zVBRFf2/O3odsvwZxf4IhbYMDsn0mboAAiDG64I
 04Z4Ajybt9yZRZiKqIoQZzibFTLN8o1uDSq+le5ld92C63yvKz42oL5hb49slgX847Uukk
 jWC4lj2sd4kf/oPYPvE9gzatCO/OiLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-laWzVkSDMqCInMXGtguI4w-1; Fri, 04 Nov 2022 00:53:04 -0400
X-MC-Unique: laWzVkSDMqCInMXGtguI4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96ABE185A78B;
 Fri,  4 Nov 2022 04:53:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6541A40C6EE9;
 Fri,  4 Nov 2022 04:53:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 486B521E6900; Fri,  4 Nov 2022 05:53:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>,  qemu-devel@nongnu.org,
 shan.gavin@gmail.com,  liuyd.fnst@fujitsu.com,  eric.auger@redhat.com,
 Igor Mammedov <imammedo@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
References: <20221103104716.179635-1-zhenyzha@redhat.com>
 <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
Date: Fri, 04 Nov 2022 05:53:02 +0100
In-Reply-To: <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 3 Nov 2022 12:00:15
 +0100")
Message-ID: <87bkpn2udt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 3/11/22 11:47, Zhenyu Zhang wrote:
>> Since the amount of prealloc-threads to smp-cpus is
>> defaulted in hostmem, so sync this information.

Has this always defaulted to smp-cpus, or did this change along the way?

>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>   qapi/qom.json | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 87fcad2423..ac4cd213a7 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -576,7 +576,7 @@
>>   #
>>   # @prealloc: if true, preallocate memory (default: false)
>>   #
>> -# @prealloc-threads: number of CPU threads to use for prealloc (default=
: 1)
>> +# @prealloc-threads: number of CPU threads to use for prealloc (default=
: smp-cpus) (since 7.1)
>
> The property is present since 5.0. Shouldn't this be "(default: smp-cpus)=
 (since 5.0)"?

Yes.

>>   #
>>   # @prealloc-context: thread context to use for creation of preallocati=
on threads
>>   #                    (default: none) (since 7.2)


