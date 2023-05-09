Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920A6FCDF4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:43:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSIC-0002At-UF; Tue, 09 May 2023 14:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSIA-0002Ag-V0
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:42:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSI9-0008U6-Al
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683657747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFtGutuf7lSh6IYYwZDwuvd6TfscIfgxio8yW31r3Ys=;
 b=KPenTEW6RQPh5ILXvhR/TqM3tX849zNc4YHOUZEGdaiEdHUNGdO9XB12F0uChyZ6IuX3SS
 etZ4yt6+A7nHkVt+6f0Hq2+EIdWdykCAbtu6XfWodKlpyHTy7qskxZG1nVaAbh/1RaUTlO
 WcHjtTrdU3QmuS2IYWh9cX/CLxzgeBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-WTuv3gTZMJeui1GP7e6W-w-1; Tue, 09 May 2023 14:42:26 -0400
X-MC-Unique: WTuv3gTZMJeui1GP7e6W-w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41efd04dfso19551595e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683657745; x=1686249745;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFtGutuf7lSh6IYYwZDwuvd6TfscIfgxio8yW31r3Ys=;
 b=DxW1Sb/RE7uk+YAtu8JF3zlfKAKFM9Nu2Dk0o0Wy32AZ5xUrs9ZPZ4CcQGhq2l1/Lv
 GegW+5TQFRhK/Pw1E7cl67Hi/L3pQGr6hnf0Y9QBUZsNNcgsE0zb81SA5ucEknic41fZ
 lHSZM2FEEbgrbwqxRyGvXz2c1ugY/eogPI/GSXYPBgmrLQdfvgxqxSO/4aMR4NBmzs61
 QPsP7KtYkYsAquYn09mFJylhSJTwdUCOhvem8yAhaYC+Coob7yUeuJA2ltKd7n/xS79h
 qNo7TEbh6yY7NO5OuH2Q9zsG/mfbp9nypB3hw+woAdZto2ykTIH1+qR5lX12lTJ5OOqs
 ryzA==
X-Gm-Message-State: AC+VfDwg1/9ooiFTxeVDAF+OgcEm9JlVT/Y5aAIWoPKshJz6Q4Mk0lo2
 gLykxKGZYQmEx7H8N+p4Je9kBIWLJwfO7UsFXZmcMqrPg8Mqtsic7diFoKWfWbznIt+zRt0nKeh
 sInMEp4+0vbeVROs=
X-Received: by 2002:a1c:ed13:0:b0:3f1:662a:93c4 with SMTP id
 l19-20020a1ced13000000b003f1662a93c4mr10627994wmh.36.1683657745328; 
 Tue, 09 May 2023 11:42:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75pNfCbYLa+SF8NaEVghJcMRkMZOaFWKlMRjW1mE+KQfY/DGGwXJgaQd6MHfdw4yzhy/KwTw==
X-Received: by 2002:a1c:ed13:0:b0:3f1:662a:93c4 with SMTP id
 l19-20020a1ced13000000b003f1662a93c4mr10627977wmh.36.1683657744982; 
 Tue, 09 May 2023 11:42:24 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c00c400b003f4290720d0sm4385272wmm.47.2023.05.09.11.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:42:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "lukasstraub2@web.de"
 <lukasstraub2@web.de>,  Paolo Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?M?=
 =?utf-8?Q?arc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Jason Wang
 <jasowang@redhat.com>
Subject: Re: [PATCH v4 04/10] configure: add --disable-colo-proxy option
In-Reply-To: <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 (Chen Zhang's message of "Thu, 4 May 2023 07:45:35 +0000")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 20:42:23 +0200
Message-ID: <87mt2dbb3k.fsf@secure.mitica>
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

"Zhang, Chen" <chen.zhang@intel.com> wrote:
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Saturday, April 29, 2023 3:49 AM
>> To: qemu-devel@nongnu.org
>> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Paolo Bonzini
>> <pbonzini@redhat.com>; Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@redhat.com>; Daniel P. Berrang=C3=A9
>> <berrange@redhat.com>; Thomas Huth <thuth@redhat.com>; Philippe
>> Mathieu-Daud=C3=A9 <philmd@linaro.org>; Jason Wang <jasowang@redhat.com>
>> Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
>>=20
>> Add option to not build filter-mirror, filter-rewriter and colo-compare =
when
>> they are not needed.
>
> Typo: This patch still build the filter-mirror/filter-redirector in filte=
r-mirror.c.
> Please remove the "filter-mirror" here.
> Other code look good to me.

Vladimir, I was doing this myself, with the bit attached.

But then I noticed that one needs to also disable
tests/qtest/test-filter-mirror and test-filter-rewriter.

Can you resend with that fixed?  Or I am missing something more
fundamental.

Thanks, Juan.

>> --- a/net/meson.build
>> +++ b/net/meson.build
>> @@ -1,13 +1,10 @@
>>  softmmu_ss.add(files(
>>    'announce.c',
>>    'checksum.c',
>> -  'colo-compare.c',
>> -  'colo.c',
>>    'dump.c',
>>    'eth.c',
>>    'filter-buffer.c',
>>    'filter-mirror.c',
>> -  'filter-rewriter.c',
>>    'filter.c',
>>    'hub.c',
>>    'net-hmp-cmds.c',
>> @@ -19,6 +16,16 @@ softmmu_ss.add(files(
>>    'util.c',
>>  ))
>>=20
>> +if get_option('replication').allowed() or \
>> +    get_option('colo_proxy').allowed()
>> +  softmmu_ss.add(files('colo-compare.c'))
>> +  softmmu_ss.add(files('colo.c'))
>> +endif
>> +
>> +if get_option('colo_proxy').allowed()
>> +  softmmu_ss.add(files('filter-rewriter.c'))
>> +endif
>> +
>>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))

This is the change needed, right?

diff --git a/net/meson.build b/net/meson.build
index 6f4ecde57f..e623bb9acb 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -4,7 +4,6 @@ softmmu_ss.add(files(
   'dump.c',
   'eth.c',
   'filter-buffer.c',
-  'filter-mirror.c',
   'filter.c',
   'hub.c',
   'net-hmp-cmds.c',
@@ -23,7 +22,7 @@ if get_option('replication').allowed() or \
 endif
=20
 if get_option('colo_proxy').allowed()
-  softmmu_ss.add(files('filter-rewriter.c'))
+  softmmu_ss.add(files('filter-rewriter.c', 'filter-mirror.c'))
 endif


