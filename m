Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC56E5CF5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:06:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohIW-0000Nc-BQ; Tue, 18 Apr 2023 05:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pohHw-0008Tf-KV
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pohHp-00064Q-OJ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681808765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkxVzlAmiLNx1xcBuTGHZZwZspJvno+R9NXCZQ84jb4=;
 b=JTdj+epRiVdfnWopAlpXABT4rFNFHr0q593o5jx4nroIq2sRe2QI8ICDlQvSyElFXjMXlV
 xGETBpRHYPIUxOtafucOxufTxeI004STX7KkJSqThjqE2KI3mgurMYbAHcHs/qcPNKjQzd
 vbQHkNy3pIC46nWy6JvHCHvJ7GbdUYU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-wOTTWaJYPkC41E5HJPv7kA-1; Tue, 18 Apr 2023 05:06:02 -0400
X-MC-Unique: wOTTWaJYPkC41E5HJPv7kA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb46fso1413860a12.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 02:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681808761; x=1684400761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VkxVzlAmiLNx1xcBuTGHZZwZspJvno+R9NXCZQ84jb4=;
 b=DeyGBkTrcFRFKO5j2JysAk8WezVMFbfcR3SGyUTo8/FhGc2Bn0Rhglnirrt2nSvruT
 sel5Oky2GK1NIpj9MRAkiu1HagjH9c6c/KqPDYTKCnaN2IX7gJ1LLStQ/5K5JoL8+2Qn
 5sdACeMaZ3Y/ha9ePbdEVel8EGKZrY831qxMQiwOsjJ4t5A2sJTNG7zOaAv4qmpl7bOm
 MBeA/01NdW+6Zgu5Awj0y3aEMuOsjFd5INOwd6vepkpswovPWvjkJQlAVT4Tm/RKYPF9
 scAEuabfdrdeycKiHEp7U8gbgf/yw/ejLpj3IhDA1RdWZY89HBEOd/pXBPEmq92cd6l/
 c0dw==
X-Gm-Message-State: AAQBX9femNz6e5pKQPVhcWzTYAqoHYTCmy5CH/vyZqxfysAWUUJPutco
 +TKqD0YUpp9WmtIknrovibT876flYQFnPrK4U1LmvPCn05rxR+KnotMoJV48nTfAgk3n5wh2mq1
 oeaAiuc2cJni3dpk=
X-Received: by 2002:aa7:cc82:0:b0:504:7f60:9f6d with SMTP id
 p2-20020aa7cc82000000b005047f609f6dmr1400697edt.9.1681808760995; 
 Tue, 18 Apr 2023 02:06:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350au7vszB49Z2DQC3613+QvsargLPeaGfAfnqz/1TXFIZ60UycreZnZhNhbcQzDuxMbiE6gyAA==
X-Received: by 2002:aa7:cc82:0:b0:504:7f60:9f6d with SMTP id
 p2-20020aa7cc82000000b005047f609f6dmr1400686edt.9.1681808760700; 
 Tue, 18 Apr 2023 02:06:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l12-20020a056402344c00b00504803f4071sm6803922edc.44.2023.04.18.02.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 02:06:00 -0700 (PDT)
Message-ID: <163e0935-73d1-12bd-7868-c70c5fe563f6@redhat.com>
Date: Tue, 18 Apr 2023 11:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] tests: libvirt-ci: Update to commit '51dad419'
Content-Language: en-US
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
 <bd11b5954d3dd1e989699370af2b9e2e0c77194a.1681735482.git.pkrempa@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bd11b5954d3dd1e989699370af2b9e2e0c77194a.1681735482.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 4/17/23 14:46, Peter Krempa wrote:
> Update to commit which has fixes needed for OpenSUSE 15.4 and
> re-generate output files.
> 
> Signed-off-by: Peter Krempa<pkrempa@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars           |  16 ++
>   .gitlab-ci.d/cirrus/freebsd-13.vars           |  16 ++
>   .gitlab-ci.d/cirrus/macos-12.vars             |  16 ++
>   tests/docker/dockerfiles/alpine.docker        | 127 +++++++++++++

Oops, I missed that '51dad419' is buggy and the next commit (2fa24dce8b) is
needed instead:

     commit 2fa24dce8bc2d0d57b02b111dbdbd24e25d4ae95
     Author: Erik Skultety <eskultet@redhat.com>
     Date:   Wed Apr 5 15:43:55 2023 +0200

     lcitool: __main__: Prevent running main() on import
     
     When commit f0cc11e3f introduced the module, it did it so that:
     1) it complies with PEP 517 [1]
     2) lcitool could be executed as a Python module
     
     The implementation is based on having a __main__.py module which Python
     can automatically import. The problem is that when the main function is
     imported from the module from within the automatic executable wrapper
     created when the package is installed, it executes the whole module on
     import (standard behaviour). At the end of the module there's an
     unguarded call to the main() function.
     Fix this with the '__name__ == "__main__"' idiom.
     
     Fixes: f0cc11e3f
     
     [1] https://peps.python.org/pep-0517/
     
     Signed-off-by: Erik Skultety <eskultet@redhat.com>

I adjusted the submodule and rerun tests/lcitool/refresh.

Paolo


