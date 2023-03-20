Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9426C0C55
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 09:36:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peAz9-0000aK-Ck; Mon, 20 Mar 2023 04:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peAz5-0000a4-JL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peAz2-0005eJ-Jj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679301311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KocitEqxI9clRLku+SnTf7MWv9b9OwWHx0eDjoT0EdU=;
 b=NrhoUtT3HSowA+bIiTjOnhyM6fbHvw6jDoUixTzYw0f3rpLEG8YySpNfyAlLQGOG7UNGbl
 CVVA1ArjtN/vyM1PgEaHwldWX5nCg6YKjZjQQRdKpgbpGV3E2QYB+U7h4oN1b/GTLshmHY
 7ii79trt2hoi9R/STcwhVAWdtDxTXlw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-YmhQX2MrNVuqmKJTVM5jSw-1; Mon, 20 Mar 2023 04:35:09 -0400
X-MC-Unique: YmhQX2MrNVuqmKJTVM5jSw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m30-20020a05600c3b1e00b003ed31d151ecso4096262wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 01:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679301308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KocitEqxI9clRLku+SnTf7MWv9b9OwWHx0eDjoT0EdU=;
 b=PZj8qm3yP1TT6WNXkdn0AkJFfG/Co03Z7+J+iciGTYnZ7qPjz7O4+6tMVEHM6SSeAb
 1RZBevjeF3a4oWOlKN47wo8y56h5OpxPnqvE7UZ+C0TgBjTlgUhNK0ER0R01M3sSEvq6
 HyoT8+MjOiR1+13qO+7KvRyE7PdEQPKfTDqY2hMHc07twmaLJnm9GDwlpJDyrS1oRvrj
 Nsj++n9UETglQNwbkbi1E908foejc3YM073px4ukfngUNj7tdYKd26c51NN6D6gYpxI0
 fB1lY67n39JDMm9ks9tNbg1sczcfXTpDfy8Z7C7LaTjOHOOo4p0r/c3k9O+5c3AOE2Rv
 S0nQ==
X-Gm-Message-State: AO0yUKWl8+x4ZD992Zxn7toA9UT3n/4+TkVxl6x38wsa7ESHi/KvrN4c
 AJl8JLUtkLKKczLIEfqViwkWZi7t0N8Dzr804GukyBs4GD5JYq6uMUxYTbWyeYsh1wa8uu/JDcn
 riRjUAPp4J4f2uk4=
X-Received: by 2002:adf:dcc2:0:b0:2ce:aa2d:c625 with SMTP id
 x2-20020adfdcc2000000b002ceaa2dc625mr13723716wrm.22.1679301308749; 
 Mon, 20 Mar 2023 01:35:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set9XMs9EhnVpY4RB2aZtOM/B4mwqB52HTkbuXT9QcZGQugtPE82wrNSAv54XM/yqQFwI/zvzxA==
X-Received: by 2002:adf:dcc2:0:b0:2ce:aa2d:c625 with SMTP id
 x2-20020adfdcc2000000b002ceaa2dc625mr13723699wrm.22.1679301308485; 
 Mon, 20 Mar 2023 01:35:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002d748d46565sm1527517wrn.74.2023.03.20.01.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 01:35:07 -0700 (PDT)
Message-ID: <7d23ab21-2e98-2e56-ad5c-e99c48b7e43d@redhat.com>
Date: Mon, 20 Mar 2023 09:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for 8.0] qemu/osdep: Switch position of "extern" and
 "G_NORETURN"
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Stefan Weil <sw@weilnetz.de>
References: <20230318185931.181659-1-shentey@gmail.com>
 <63A14BB7-4ED0-4BA4-BC6C-5704AED811C1@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <63A14BB7-4ED0-4BA4-BC6C-5704AED811C1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

T24gMTgvMDMvMjAyMyAyMS4yMywgQmVybmhhcmQgQmVzY2hvdyB3cm90ZToNCj4gKyBUaG9t
YXMsIERhbmllbCAoZ2l0bGFiIGlzc3VlKSBhbmQgU3RlZmFuIChXaW5kb3dzKQ0KDQpUaGFu
a3MsIEknbGwgcGljayB0aGUgcGF0Y2ggZm9yIG15IG5leHQgcHVsbCByZXF1ZXN0Lg0KDQog
IFRob21hcw0KDQoNCj4gQW0gMTguIE3DpHJ6IDIwMjMgMTg6NTk6MzEgVVRDIHNjaHJpZWIg
QmVybmhhcmQgQmVzY2hvdyA8c2hlbnRleUBnbWFpbC5jb20+Og0KPj4gRml4ZXMgdGhlIFdp
bmRvd3MgYnVpbGQgdW5kZXIgbXN5czIgdXNpbmcgR0NDIDEyIHdoaWNoIGZhaWxzIHdpdGgg
dGhlIGZvbGxvd2luZw0KPj4gZXJyb3I6DQo+Pg0KPj4gICBbMTg0LzU3OV0gQ29tcGlsaW5n
IEMrKyBvYmplY3QgcWdhL3Zzcy13aW4zMi9xZ2EtdnNzLmRsbC5wL2luc3RhbGwuY3BwLm9i
ag0KPj4gICBGQUlMRUQ6IHFnYS92c3Mtd2luMzIvcWdhLXZzcy5kbGwucC9pbnN0YWxsLmNw
cC5vYmoNCj4+ICAgImMrKyIgIi1tNjQiICItbWN4MTYiICItSXFnYS92c3Mtd2luMzIvcWdh
LXZzcy5kbGwucCIgIi1JcWdhL3Zzcy13aW4zMiIgIi1JLi4vc3JjL3FnYS92c3Mtd2luMzIi
ICItSS4iICItSXFhcGkiICItSXRyYWNlIiAiLUl1aSIgIi1JdWkvc2hhZGVyIiAiLUlDOi9t
c3lzNjQvbWluZ3c2NC9pbmNsdWRlL2dsaWItMi4wIiAiLUlDOi9tc3lzNjQvbWluZ3c2NC9s
aWIvZ2xpYi0yLjAvaW5jbHVkZSIgIi1mZGlhZ25vc3RpY3MtY29sb3I9YXV0byIgIi1XYWxs
IiAiLVdpbnZhbGlkLXBjaCIgIi1Xbm9uLXZpcnR1YWwtZHRvciIgIi1XZXJyb3IiICItc3Rk
PWdudSsrMTEiICItZyIgIi1pcXVvdGUiICIuIiAiLWlxdW90ZSIgIkM6L21zeXM2NC9ob21l
L3NoZW50ZXkvUHJvamVjdHMvcWVtdS9zcmMiICItaXF1b3RlIiAiQzovbXN5czY0L2hvbWUv
c2hlbnRleS9Qcm9qZWN0cy9xZW11L3NyYy9pbmNsdWRlIiAiLWlxdW90ZSIgIkM6L21zeXM2
NC9ob21lL3NoZW50ZXkvUHJvamVjdHMvcWVtdS9zcmMvdGNnL2kzODYiICItRF9fU1REQ19M
SU1JVF9NQUNST1MiICItRF9fU1REQ19DT05TVEFOVF9NQUNST1MiICItRF9fU1REQ19GT1JN
QVRfTUFDUk9TIiAiLWZuby1waWUiICItbm8tcGllIiAiLURfR05VX1NPVVJDRSIgIi1EX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQiICItRF9MQVJHRUZJTEVfU09VUkNFIiAiLWZuby1zdHJpY3Qt
YWxpYXNpbmciICItZm5vLWNvbW1vbiIgIi1md3JhcHYiICItV3VuZGVmIiAiLVd3cml0ZS1z
dHJpbmdzIiAiLVd0eXBlLWxpbWl0cyIgIi1XZm9ybWF0LXNlY3VyaXR5IiAiLVdmb3JtYXQt
eTJrIiAiLVdpbml0LXNlbGYiICItV2lnbm9yZWQtcXVhbGlmaWVycyIgIi1XZW1wdHktYm9k
eSIgIi1XZW5kaWYtbGFiZWxzIiAiLVdleHBhbnNpb24tdG8tZGVmaW5lZCIgIi1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9MiIgIi1XbWlzc2luZy1mb3JtYXQtYXR0cmlidXRlIiAiLVduby1t
aXNzaW5nLWluY2x1ZGUtZGlycyIgIi1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWUiICItV25v
LXBzYWJpIiAiLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIiAiLVduby11bmtub3duLXByYWdt
YXMiICItV25vLWRlbGV0ZS1ub24tdmlydHVhbC1kdG9yIiAiLVduby1ub24tdmlydHVhbC1k
dG9yIiAtTUQgLU1RIHFnYS92c3Mtd2luMzIvcWdhLXZzcy5kbGwucC9pbnN0YWxsLmNwcC5v
YmogLU1GICJxZ2EvdnNzLXdpbjMyL3FnYS12c3MuZGxsLnAvaW5zdGFsbC5jcHAub2JqLmQi
IC1vIHFnYS92c3Mtd2luMzIvcWdhLXZzcy5kbGwucC9pbnN0YWxsLmNwcC5vYmogIi1jIiAu
Li9zcmMvcWdhL3Zzcy13aW4zMi9pbnN0YWxsLmNwcA0KPj4gICBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gQzovbXN5czY0L21pbmd3NjQvbGliL2dsaWItMi4wL2luY2x1ZGUvZ2xpYmNvbmZp
Zy5oOjksDQo+PiAgICAgICAgICAgICAgIGZyb20gQzovbXN5czY0L21pbmd3NjQvaW5jbHVk
ZS9nbGliLTIuMC9nbGliL2d0eXBlcy5oOjM0LA0KPj4gICAgICAgICAgICAgICBmcm9tIEM6
L21zeXM2NC9taW5ndzY0L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9nYWxsb2NhLmg6MzQsDQo+
PiAgICAgICAgICAgICAgIGZyb20gQzovbXN5czY0L21pbmd3NjQvaW5jbHVkZS9nbGliLTIu
MC9nbGliLmg6MzIsDQo+PiAgICAgICAgICAgICAgIGZyb20gQzovbXN5czY0L2hvbWUvc2hl
bnRleS9Qcm9qZWN0cy9xZW11L3NyYy9pbmNsdWRlL2dsaWItY29tcGF0Lmg6MzIsDQo+PiAg
ICAgICAgICAgICAgIGZyb20gQzovbXN5czY0L2hvbWUvc2hlbnRleS9Qcm9qZWN0cy9xZW11
L3NyYy9pbmNsdWRlL3FlbXUvb3NkZXAuaDoxNDQsDQo+PiAgICAgICAgICAgICAgIGZyb20g
Li4vc3JjL3FnYS92c3Mtd2luMzIvaW5zdGFsbC5jcHA6MTM6DQo+PiAgIEM6L21zeXM2NC9t
aW5ndzY0L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9nbWFjcm9zLmg6MTA3NToyMTogZXJyb3I6
IHN0YW5kYXJkIGF0dHJpYnV0ZXMgaW4gbWlkZGxlIG9mIGRlY2wtc3BlY2lmaWVycw0KPj4g
ICAxMDc1IHwgIyBkZWZpbmUgR19OT1JFVFVSTiBbW25vcmV0dXJuXV0NCj4+ICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgIF4NCj4+ICAgQzovbXN5czY0L2hvbWUvc2hlbnRleS9Q
cm9qZWN0cy9xZW11L3NyYy9pbmNsdWRlL3FlbXUvb3NkZXAuaDoyNDA6ODogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvICdHX05PUkVUVVJOJw0KPj4gICAyNDAgfCBleHRlcm4gR19O
T1JFVFVSTg0KPj4gICAgICAgICB8ICAgICAgICBefn5+fn5+fn5+DQo+PiAgIEM6L21zeXM2
NC9taW5ndzY0L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9nbWFjcm9zLmg6MTA3NToyMTogbm90
ZTogc3RhbmRhcmQgYXR0cmlidXRlcyBtdXN0IHByZWNlZGUgdGhlIGRlY2wtc3BlY2lmaWVy
cyB0byBhcHBseSB0byB0aGUgZGVjbGFyYXRpb24sIG9yIGZvbGxvdyB0aGVtIHRvIGFwcGx5
IHRvIHRoZSB0eXBlDQo+PiAgIDEwNzUgfCAjIGRlZmluZSBHX05PUkVUVVJOIFtbbm9yZXR1
cm5dXQ0KPj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXg0KPj4gICBDOi9tc3lz
NjQvaG9tZS9zaGVudGV5L1Byb2plY3RzL3FlbXUvc3JjL2luY2x1ZGUvcWVtdS9vc2RlcC5o
OjI0MDo4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0dfTk9SRVRVUk4nDQo+PiAg
IDI0MCB8IGV4dGVybiBHX05PUkVUVVJODQo+PiAgICAgICAgIHwgICAgICAgIF5+fn5+fn5+
fn4NCj4+ICAgQzovbXN5czY0L21pbmd3NjQvaW5jbHVkZS9nbGliLTIuMC9nbGliL2dtYWNy
b3MuaDoxMDc1OjIxOiBlcnJvcjogYXR0cmlidXRlIGlnbm9yZWQgWy1XZXJyb3I9YXR0cmli
dXRlc10NCj4+ICAgMTA3NSB8ICMgZGVmaW5lIEdfTk9SRVRVUk4gW1tub3JldHVybl1dDQo+
PiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBeDQo+PiAgIEM6L21zeXM2NC9ob21l
L3NoZW50ZXkvUHJvamVjdHMvcWVtdS9zcmMvaW5jbHVkZS9xZW11L29zZGVwLmg6MjQwOjg6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnR19OT1JFVFVSTicNCj4+ICAgMjQwIHwg
ZXh0ZXJuIEdfTk9SRVRVUk4NCj4+ICAgICAgICAgfCAgICAgICAgXn5+fn5+fn5+fg0KPj4g
ICBDOi9tc3lzNjQvbWluZ3c2NC9pbmNsdWRlL2dsaWItMi4wL2dsaWIvZ21hY3Jvcy5oOjEw
NzU6MjE6IG5vdGU6IGFuIGF0dHJpYnV0ZSB0aGF0IGFwcGVydGFpbnMgdG8gYSB0eXBlLXNw
ZWNpZmllciBpcyBpZ25vcmVkDQo+PiAgIDEwNzUgfCAjIGRlZmluZSBHX05PUkVUVVJOIFtb
bm9yZXR1cm5dXQ0KPj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXg0KPj4gICBD
Oi9tc3lzNjQvaG9tZS9zaGVudGV5L1Byb2plY3RzL3FlbXUvc3JjL2luY2x1ZGUvcWVtdS9v
c2RlcC5oOjI0MDo4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0dfTk9SRVRVUk4n
DQo+PiAgIDI0MCB8IGV4dGVybiBHX05PUkVUVVJODQo+PiAgICAgICAgIHwgICAgICAgIF5+
fn5+fn5+fn4NCj4+ICAgY2MxcGx1cy5leGU6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVk
IGFzIGVycm9ycw0KPj4NCj4+IEFwcGFyZW50bHkgaXQgYWxzbyBmaXhlcyB0aGUgY29tcGls
YXRpb24gd2l0aCBDbGFuZyAxNSAoc2VlDQo+PiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1w
cm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTU0MSApLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEJl
cm5oYXJkIEJlc2Nob3cgPHNoZW50ZXlAZ21haWwuY29tPg0KPj4gLS0tDQo+PiBpbmNsdWRl
L3FlbXUvb3NkZXAuaCB8IDIgKy0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUvb3Nk
ZXAuaCBiL2luY2x1ZGUvcWVtdS9vc2RlcC5oDQo+PiBpbmRleCBmNjhiNWQ4NzA4Li45ZWZm
MGJlOTViIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9xZW11L29zZGVwLmgNCj4+ICsrKyBi
L2luY2x1ZGUvcWVtdS9vc2RlcC5oDQo+PiBAQCAtMjM3LDcgKzIzNyw3IEBAIGV4dGVybiAi
QyIgew0KPj4gICAqIHN1cHBvcnRzIFFFTVVfRVJST1IsIHRoaXMgd2lsbCBiZSByZXBvcnRl
ZCBhdCBjb21waWxlIHRpbWU7IG90aGVyd2lzZQ0KPj4gICAqIHRoaXMgd2lsbCBiZSByZXBv
cnRlZCBhdCBsaW5rIHRpbWUgZHVlIHRvIHRoZSBtaXNzaW5nIHN5bWJvbC4NCj4+ICAgKi8N
Cj4+IC1leHRlcm4gR19OT1JFVFVSTg0KPj4gK0dfTk9SRVRVUk4gZXh0ZXJuDQo+PiB2b2lk
IFFFTVVfRVJST1IoImNvZGUgcGF0aCBpcyByZWFjaGFibGUiKQ0KPj4gICAgICBxZW11X2J1
aWxkX25vdF9yZWFjaGVkX2Fsd2F5cyh2b2lkKTsNCj4+ICNpZiBkZWZpbmVkKF9fT1BUSU1J
WkVfXykgJiYgIWRlZmluZWQoX19OT19JTkxJTkVfXykNCj4gDQoNCg==


