Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1356C4CBC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0r-0003qa-LP; Wed, 22 Mar 2023 10:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pez0l-0003me-Gx
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pez0j-0002Ri-RQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679493616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDTdM+fY1A7Jn4pQFBFnaP+fwfjQvlJtbHWrnLWg0Po=;
 b=H1tcMsKzyU21jaqrFVul5G54nTr71XsA7fZkNcQOrPuvG4RogwEYvep2yu2XGZ+ee9s8Uy
 q0+o1I0QWGnNm5Kf5KPKJS+K2YKFTbQbN9JHx6Ogzg7QSrBrhFwP7mU+vVdSRifoznQ5OS
 LF5b/Iih7S39M3u7XpjMHb/mlEfLTK8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-Ratf8Gn6PZmOhtuYWrI9EQ-1; Wed, 22 Mar 2023 10:00:15 -0400
X-MC-Unique: Ratf8Gn6PZmOhtuYWrI9EQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 dg8-20020a056214084800b005acc280bf19so9308900qvb.22
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679493614;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDTdM+fY1A7Jn4pQFBFnaP+fwfjQvlJtbHWrnLWg0Po=;
 b=zJRydS3k4G9hHk31UFLHTkPRkmXtNBgjgnf4tm1FZikhzL9vwWsVU5HGlOujiuq8HQ
 dfT2IueW1p1s7tA6nhanJIIJyxjvK1sADPrM1eYJT/6QktLuOfWBDm4Fx/5MqonJ4ll+
 Z8dosA9p7g95K797AyX286IzJkPZa3DpEThVv5Z3TAv+mBoIsg9jIMe7ev2TbbwAm4bj
 0sXT6zEPpJJ3l0DHcqhNWt4ploRZvgOnMTnvkPw3ZVUhM6pzqgvizJPTaVjSgdW1thgb
 aJWcYarmXApdTNnbL3F9ewR+vbZbSLYcloIoLBBWIOX+uY5j3yJgTb8VWA3wGDcGm7NQ
 RGDw==
X-Gm-Message-State: AO0yUKVT73HJ7Wxebt5O0m8WnHVYTyP42dqZ0edhkg2/OOl46KTaToSW
 giXtuU8gzwEdzOln+8UraOfh7Lc6Sa/H0YaINWp+s3WKc/R4PdQr7uay+4CqCNMMJffXXz9k0Y0
 WQ82Z0B+a46CoX0Q=
X-Received: by 2002:a05:622a:1456:b0:3e0:4e3d:6f5c with SMTP id
 v22-20020a05622a145600b003e04e3d6f5cmr5778729qtx.49.1679493614353; 
 Wed, 22 Mar 2023 07:00:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set/q0NXz6CTY+PSovtNleYkScKKNgbPj3Sj4cRld0prvhOeQ1LqTYoQvHd859kgM7hdOIhprdQ==
X-Received: by 2002:a05:622a:1456:b0:3e0:4e3d:6f5c with SMTP id
 v22-20020a05622a145600b003e04e3d6f5cmr5778662qtx.49.1679493613941; 
 Wed, 22 Mar 2023 07:00:13 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 c7-20020ac86e87000000b003e1ff058350sm5232203qtv.63.2023.03.22.07.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:00:13 -0700 (PDT)
Message-ID: <3237c289-b8c2-6ea2-8bfb-7eeed637efc7@redhat.com>
Date: Wed, 22 Mar 2023 15:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel
 <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>,
 "Borntraeger, Christian" <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, fiuczy@linux.ibm.com,
 Halil Pasic <pasic@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com> <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
 <CABgObfaN3sLipc2UuoZc2yHP0YK3e59sK5wn8gpkJ8xgNHc7qg@mail.gmail.com>
 <ZBrKVGVHRtqyaKvL@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
In-Reply-To: <ZBrKVGVHRtqyaKvL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/03/2023 10.28, Daniel P. Berrangé wrote:
> On Tue, Mar 21, 2023 at 09:47:57PM +0100, Paolo Bonzini wrote:
>> Il lun 20 mar 2023, 16:42 Thomas Huth <thuth@redhat.com> ha scritto:
>>
>>> Would it make sense to add it e.g. to "-action" instead, i.e. something
>>> like
>>> "-action teardown=async" ?
>>>
>>
>> -action is just a wrapper for the action-set QMP command. I don't think it
>> fits very well; its arguments are only guest actions while asynchronous
>> tear down happens for example when you issue a quit command on the monitor.
> 
> Right, we discussed -action when this feature was first proposed and
> that was the reason it was discounted.

I guess that was this thread here :

  https://mail.gnu.org/archive/html/qemu-devel/2022-08/msg04479.html

?

Anyway, how to continue now here? If I've got that right, we currently need 
an option that takes a parameter if we want to make it visible via QAPI, right?

So maybe remove the previous option (since it cannot be used by upper layer 
like libvirt anyway yet), and introduce a new one like "-teardown 
async|sync" ? Or rework the current one into "-async-teardown on|off" 
(similar to "-sandbox on")? Any preferences?

Or do we want something even more generic instead, e.g.:

  -run-with teardown=async
  -run-with daemonized=on
  -run-with chroot=/path/to/chroot/dir
  -run-with userid=UID

... so we could get rid of -deamonize, -chroot and -runas and other similar 
options one day?

  Thomas


