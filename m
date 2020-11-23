Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311CE2C0ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:29:28 +0100 (CET)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDmR-0004XD-8K
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khDlH-0003jQ-TI
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khDlF-0001Qz-4B
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606145291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lpRE1ujPN+Q78qZCrx/Yt7jqDZTdZPnCDWNLtqoUlU=;
 b=KzI2s8OcKbee5a7A8g7+ck7EyTTseRxdcay4b9X7kGbDPiVHa5BQogQ982U2kPFfZxLMlc
 SxppXPFiYLkwwTSlTRjB1zwbmIcaAvUyD1rDOn+BuyRtyrYemaqaBUE4Vay1sPN6IGc1GU
 sjRY6U24n9MimyJBEm8fTycE9e+qu2w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ZklwmYAvMK2TxjC2NyEsKA-1; Mon, 23 Nov 2020 10:28:09 -0500
X-MC-Unique: ZklwmYAvMK2TxjC2NyEsKA-1
Received: by mail-ed1-f71.google.com with SMTP id b13so6684235edy.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lpRE1ujPN+Q78qZCrx/Yt7jqDZTdZPnCDWNLtqoUlU=;
 b=gbUlBxCbgiuIZQN1fyDSpG5Ir7Uq1BiQRj8BbhTzkTlKaCZso17+KqUxzKsI+xr8nU
 iiF6hVPPm3OnXSxOFmRkSPIqNezNbHpx0CBbIMnghKT4hnjHQhUuwDpOF4cypauHzcWM
 1NNhHRkuA0HAPaCfiZmffON4fihfaagg0RIMWPFbLgB9BrRxazQIviS2hwrSMJoFSddg
 uH9EKe933mO1xPtezWzp3OvjPuYQKi+dsWXBK4CM3krMA8jEgndR2zijBvVOGbeWbN8N
 G/ryTlSKbLZZfO/7fKlwN8rHQN/+8SDd9uNsYgwzR2pariLonzV3f9ZZh4mc2MVVK/th
 WHog==
X-Gm-Message-State: AOAM5335y4eT1M4G50phE54LYCpdd7QjrcD/Tux5S0YN9qDw2uyfnXra
 A29Q9pjR7XgUP+SN0W9keiGXmIbifXKV54sM627y2lAJDHacozB8nF2jTf6GjowqBGdxMaAd9vt
 xvcVkPByKFXsSegmCPG8OTNFc3Lwnwv8kSfDZrlSkRWvWJEoW0Wor2+v9iyEjXZOBh/A=
X-Received: by 2002:aa7:d4da:: with SMTP id t26mr1608888edr.134.1606145288086; 
 Mon, 23 Nov 2020 07:28:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww5kvzYLmbdWmEPSnq/r8MMeDeHWAkHMtj/0RtkYbmSmICMFm/jvAT9kZAQ1rP28gIl4B6Zw==
X-Received: by 2002:aa7:d4da:: with SMTP id t26mr1608864edr.134.1606145287883; 
 Mon, 23 Nov 2020 07:28:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id aq15sm5187384ejc.70.2020.11.23.07.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 07:28:07 -0800 (PST)
Subject: Re: Regressions in build process introduced since August
To: Stefan Weil <sw@weilnetz.de>, Stefano Garzarella <sgarzare@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
 <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ccb03ba-32ed-be75-4c12-ad68cf00aa88@redhat.com>
Date: Mon, 23 Nov 2020 16:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/20 15:40, Stefan Weil wrote:
> The Meson checks obviously don't use those flags.

Indeed they don't.  For 0.56 however something like this should be doable:

diff --git a/meson.build b/meson.build
index 5062407c70..25940f8de7 100644
--- a/meson.build
+++ b/meson.build
@@ -107,6 +107,22 @@ 
add_project_arguments(config_host['QEMU_CXXFLAGS'].split(),
  add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
                             native: false, language: ['c', 'cpp', 'objc'])

+include_args = []
+library_dirs = []
+foreach arg : config_host['QEMU_CFLAGS'].split() + 
config_host['QEMU_LDFLAGS'].split()
+  if arg.startswith('-I')
+    include_args += arg
+  endif
+  if arg.startswith('-L')
+    library_dirs = arg.substring(2)
+  endif
+endif
+find_library_args = {
+  'static': enable_static,
+  'header_args': include_args,
+  'dirs': library_dirs
+}
+
  if targetos == 'linux'
    add_project_arguments('-isystem', meson.current_source_dir() / 
'linux-headers',
                          '-isystem', 'linux-headers',
  @@ -656,10 +672,10 @@ if get_option('vnc').enabled()
                     method: 'pkg-config', static: enable_static)
    jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
                           required: get_option('vnc_jpeg'),
-                         static: enable_static)
+                         kwargs: find_library_args)
    sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
                           required: get_option('vnc_sasl'),
-                         static: enable_static)
+                         kwargs: find_library_args)
    if sasl.found()
      sasl = declare_dependency(dependencies: sasl,
                                compile_args: '-DSTRUCT_IOVEC_DEFINED')

Paolo


