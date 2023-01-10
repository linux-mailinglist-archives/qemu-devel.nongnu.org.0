Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838A663CF1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA4n-00089j-8I; Tue, 10 Jan 2023 03:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFA4b-00088J-9N
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFA4Z-0007Uy-Lf
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673339610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtVyif+qyUhJuQYbxm2K5SAcb3P9mBa5GS2LJQ/P0QY=;
 b=Ot0qVS2Od2X98k3yS9q6ckPeQ45rwdYtQGyqcp7Sr6JQ+tlnOrcVg227D/VZVSvrLXvNnP
 obK4GiolvTqYpWpAXpSGEOhimaTCrdK5B86XMAKX/O0ZZkumjnOs1zb8hdGFv9zxXpLC65
 rhFqbDzzUyVbfbo/AEnrl/QY7NyGlOg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-EQZRTXz8NvOBINTPQNoTgg-1; Tue, 10 Jan 2023 03:33:29 -0500
X-MC-Unique: EQZRTXz8NvOBINTPQNoTgg-1
Received: by mail-qk1-f198.google.com with SMTP id
 l16-20020a05620a28d000b00704af700820so8187110qkp.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtVyif+qyUhJuQYbxm2K5SAcb3P9mBa5GS2LJQ/P0QY=;
 b=RhL8vrKjkio2NOwwbrlkqv2QVv0lHRc4KVg7r+dtLypkgEdAKJGLx4uBIHgH0TYtcQ
 Qjsk9PWuP3UlZlDd5beGpTedUivS9bCaPcL/h9rDgbCIZusZqtA7exOJXZXVctHlhiqT
 jRL6Ot7BEKW5HxKIpdgoceXiBRvJfjXZM8l2O8TZAPUYIDUKScjffEfe2uTdRqhYj7qZ
 gydTOl5mioOuSPsGzR98xLd34PmoEoPWRez6YHgBOnWUcdLWAfq9dNiWF9YJ/xQSjxzi
 u6ulkdgvZrTtBcmXu6n18SKERegUorKJx47hbjhQ2vFKiwtO/n7bmKPhdKmGM3S7lc3+
 xYJA==
X-Gm-Message-State: AFqh2krT1JQjONI/pdbR+JFHrGDemkJ0aCyUkHJl7gnXnBOufwWjDwJV
 OH6rR0ZMYL0RnYz7WXZ/Xxpqb6Eth0ctDs2gSB83XWBH03yZJViOPNZyJ++yx9l7l2u4jUFDfcZ
 6QbeYsg4CVNKwPFo=
X-Received: by 2002:a05:622a:8c8:b0:3ad:fdb5:46c8 with SMTP id
 i8-20020a05622a08c800b003adfdb546c8mr7367428qte.10.1673339609045; 
 Tue, 10 Jan 2023 00:33:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGbkVlU/vVbM9wiFsJySy/VoWPctgVqAhR8EUHMNtB55uV54MQq8t4azbOE/LSIPzgfFhgKQ==
X-Received: by 2002:a05:622a:8c8:b0:3ad:fdb5:46c8 with SMTP id
 i8-20020a05622a08c800b003adfdb546c8mr7367405qte.10.1673339608798; 
 Tue, 10 Jan 2023 00:33:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 w28-20020a05622a191c00b0039cc64bcb53sm5692800qtc.27.2023.01.10.00.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:33:28 -0800 (PST)
Message-ID: <b3f236ad-6e18-c735-a4ba-6f35cf9f3cdf@redhat.com>
Date: Tue, 10 Jan 2023 09:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <20230110080246.536056-2-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 1/8] build-sys: fix crlf-ending C code
In-Reply-To: <20230110080246.536056-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/01/2023 09.02, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> On msys2, the shader-to-C script produces bad C:
> ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]
> 
> Fix it by changing the line ending from crlf to lf, and convert the
> script to Python (qemu build seems perl-free after that).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build              |  2 +-
>   scripts/shaderinclude.pl | 16 ----------------
>   scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
>   3 files changed, 27 insertions(+), 17 deletions(-)
>   delete mode 100644 scripts/shaderinclude.pl
>   create mode 100755 scripts/shaderinclude.py

This seems to break our "make vm-build-freebsd" test... I'm now getting:

[281/1485] Generating ui/shader/texture-blit-frag.h with a custom command 
(wrapped by meson to capture output)
FAILED: ui/shader/texture-blit-frag.h
/usr/local/bin/python3.7 /usr/home/qemu/qemu-test.SnknY0/src/meson/meson.py 
--internal exe --capture ui/shader/texture-blit-frag.h -- 
/usr/home/qemu/qemu-test.SnknY0/src/scripts/shaderinclude.py 
../src/ui/shader/texture-blit.frag
--- stderr ---
env: python3: No such file or directory

Looks like you've got to do "chmod a-x scripts/shaderinclude.py" to get this 
fixed, after removing the executable bits, I'm getting:

[281/1485] Generating ui/shader/texture-blit-frag.h with a custom command 
(wrapped by meson to capture output)

and the compilation process continues happily.

  Thomas


