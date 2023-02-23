Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F46A059B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8Tp-0008P4-4y; Thu, 23 Feb 2023 05:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pV8Tl-0008Ow-0r
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:05:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pV8Ta-0003vb-F4
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677146720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uidp6FdCQDyCxbMhXKbjiIJTKBcDbkwnP6MCX0WO/l8=;
 b=ZrFANZFEXz/NsY9uvCHyc9FVzyTla3X3utFt6x8F8PT/P8hKkhL/9P4+cJyOKW+O5esJs9
 r2LlTrrO9iDM3QR5Gm04UAJv4M+4dnM2AyU5q3sNS+19hJEZhDhVm0Kxwgttl6jKyXWsOG
 DRgHr5VjAmmYklK2d/f8JVpXKW0cSiA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-xpu9VkbUPGOUjblt1UdRtQ-1; Thu, 23 Feb 2023 05:05:19 -0500
X-MC-Unique: xpu9VkbUPGOUjblt1UdRtQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 8-20020a370508000000b00724fd33cb3eso4957709qkf.14
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uidp6FdCQDyCxbMhXKbjiIJTKBcDbkwnP6MCX0WO/l8=;
 b=u/732wFcqC2YCE6XLb/Jez/074U1Hao0zEUX7g6qhf9Q8pCNpHbOvVxKav2FuN1r/c
 SOB3gSraBQFtj1RRRt2XEuTobo/RLo8A8FsUCQQoIXrH4xnN/XzUdqi/QddaLCF4860I
 WkNn+Jw7WaGCULMRm+kawtGjocRXiSv+AdBmcyODQTsaHbUVNQDlW77ByBoAHeuS+6vO
 nf6GhQm3Khy0uaYbSIaWoAFKXnAvy/Q9axOoF8jNhx6hrM/2mr9cicCnCHC96zPtt+QE
 rdVuNE2THIc7Jo9VRkSbolvFyqypdHUEy2NuZabncAd0Pig3RLag7QLUD/XmVd5FG+HL
 r3Jw==
X-Gm-Message-State: AO0yUKXEDF9MtruoCloQ0An0GZRaJcSVttcdOJVITXS4QbkTqSiliGHt
 MAhWR+/kToJ3zpW3irG5t0C9yfOA63UzEV+Rgb0EueNvkFomZvnGtU+X4nMDdfJ9wJNKO5eX1My
 JyQhuAfwkjR6eLho=
X-Received: by 2002:ad4:5e8a:0:b0:56e:ad32:2d58 with SMTP id
 jl10-20020ad45e8a000000b0056ead322d58mr22551498qvb.6.1677146717576; 
 Thu, 23 Feb 2023 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/XvCFyLC5Xu+8CArswLrgIgNB323z1tq9eWVtHhqHIo2decEHh/Y+JtU7VJc/YDd60ab+9MA==
X-Received: by 2002:ad4:5e8a:0:b0:56e:ad32:2d58 with SMTP id
 jl10-20020ad45e8a000000b0056ead322d58mr22551470qvb.6.1677146717331; 
 Thu, 23 Feb 2023 02:05:17 -0800 (PST)
Received: from ?IPV6:2a01:cb19:853d:fa00:1e95:1e1a:1430:ba59?
 ([2a01:cb19:853d:fa00:1e95:1e1a:1430:ba59])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a376484000000b0071ddbe8fe23sm4151685qkb.24.2023.02.23.02.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:05:17 -0800 (PST)
Message-ID: <12e40895-82dd-2529-5df7-50ff528ab5f6@redhat.com>
Date: Thu, 23 Feb 2023 11:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230222135512.51b62650.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

T24gMi8yMi8yMyAyMTo1NSwgQWxleCBXaWxsaWFtc29uIHdyb3RlOg0KPiANCj4gVGhlcmUg
YXJlIHZhcmlvdXMgZXJyb3JzIHJ1bm5pbmcgdGhpcyB0aHJvdWdoIHRoZSBDSSBvbiBnaXRs
YWIuDQo+IA0KPiBUaGlzIG9uZSBzZWVtcyBib2d1cyBidXQgbmVlZHMgdG8gYmUgcmVzb2x2
ZWQgcmVnYXJkbGVzczoNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9hbGV4LndpbGxpYW1z
b24vcWVtdS8tL2pvYnMvMzgxNzk0MDczMQ0KPiBGQUlMRUQ6IGxpYnFlbXUtYWFyY2g2NC1z
b2Z0bW11LmZhLnAvaHdfdmZpb19jb21tb24uYy5vDQo+IDI3ODZzMzkweC1saW51eC1nbnUt
Z2NjIC1tNjQgLUlsaWJxZW11LWFhcmNoNjQtc29mdG1tdS5mYS5wIC1JLiAtSS4uIC1JdGFy
Z2V0L2FybSAtSS4uL3RhcmdldC9hcm0gLUlxYXBpIC1JdHJhY2UgLUl1aSAtSXVpL3NoYWRl
ciAtSS91c3IvaW5jbHVkZS9waXhtYW4tMSAtSS91c3IvaW5jbHVkZS9jYXBzdG9uZSAtSS91
c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91c3IvbGliL3MzOTB4LWxpbnV4LWdudS9nbGliLTIu
MC9pbmNsdWRlIC1mZGlhZ25vc3RpY3MtY29sb3I9YXV0byAtV2FsbCAtV2ludmFsaWQtcGNo
IC1XZXJyb3IgLXN0ZD1nbnUxMSAtTzIgLWcgLWlzeXN0ZW0gL2J1aWxkcy9hbGV4LndpbGxp
YW1zb24vcWVtdS9saW51eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90
ZSAuIC1pcXVvdGUgL2J1aWxkcy9hbGV4LndpbGxpYW1zb24vcWVtdSAtaXF1b3RlIC9idWls
ZHMvYWxleC53aWxsaWFtc29uL3FlbXUvaW5jbHVkZSAtaXF1b3RlIC9idWlsZHMvYWxleC53
aWxsaWFtc29uL3FlbXUvdGNnL3MzOTB4IC1wdGhyZWFkIC1VX0ZPUlRJRllfU09VUkNFIC1E
X0ZPUlRJRllfU09VUkNFPTIgLURfR05VX1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0
IC1EX0xBUkdFRklMRV9TT1VSQ0UgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24g
LWZ3cmFwdiAtV3VuZGVmIC1Xd3JpdGUtc3RyaW5ncyAtV21pc3NpbmctcHJvdG90eXBlcyAt
V3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1Xb2xkLXN0eWxlLWRlY2xh
cmF0aW9uIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVd0eXBlLWxpbWl0cyAtV2Zvcm1hdC1z
ZWN1cml0eSAtV2Zvcm1hdC15MmsgLVdpbml0LXNlbGYgLVdpZ25vcmVkLXF1YWxpZmllcnMg
LVdlbXB0eS1ib2R5IC1XbmVzdGVkLWV4dGVybnMgLVdlbmRpZi1sYWJlbHMgLVdleHBhbnNp
b24tdG8tZGVmaW5lZCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTIgLVdtaXNzaW5nLWZvcm1h
dC1hdHRyaWJ1dGUgLVduby1taXNzaW5nLWluY2x1ZGUtZGlycyAtV25vLXNoaWZ0LW5lZ2F0
aXZlLXZhbHVlIC1Xbm8tcHNhYmkgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1mUElFIC1p
c3lzdGVtLi4vbGludXgtaGVhZGVycyAtaXN5c3RlbWxpbnV4LWhlYWRlcnMgLURORUVEX0NQ
VV9IICctRENPTkZJR19UQVJHRVQ9ImFhcmNoNjQtc29mdG1tdS1jb25maWctdGFyZ2V0Lmgi
JyAnLURDT05GSUdfREVWSUNFUz0iYWFyY2g2NC1zb2Z0bW11LWNvbmZpZy1kZXZpY2VzLmgi
JyAtTUQgLU1RIGxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11LmZhLnAvaHdfdmZpb19jb21tb24u
Yy5vIC1NRiBsaWJxZW11LWFhcmNoNjQtc29mdG1tdS5mYS5wL2h3X3ZmaW9fY29tbW9uLmMu
by5kIC1vIGxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11LmZhLnAvaHdfdmZpb19jb21tb24uYy5v
IC1jIC4uL2h3L3ZmaW8vY29tbW9uLmMNCj4gMjc4Ny4uL2h3L3ZmaW8vY29tbW9uLmM6IElu
IGZ1bmN0aW9uIOKAmHZmaW9fbGlzdGVuZXJfbG9nX2dsb2JhbF9zdGFydOKAmToNCj4gMjc4
OC4uL2h3L3ZmaW8vY29tbW9uLmM6MTc3Mjo4OiBlcnJvcjog4oCYcmV04oCZIG1heSBiZSB1
c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmlu
aXRpYWxpemVkXQ0KPiAyNzg5IDE3NzIgfCAgICAgaWYgKHJldCkgew0KPiAyNzkwICAgICAg
fCAgICAgICAgXg0KDQoNClRoZSByb3V0aW5lIHRvIGZpeCBpcyB2ZmlvX2RldmljZXNfc3Rh
cnRfZGlydHlfcGFnZV90cmFja2luZygpLiBUaGUgY29tcGlsZXINCmlzIGRvaW5nIHNvbWUg
aW5saW5pbmcuDQoNClRoYW5rcywNCkMuDQo=


