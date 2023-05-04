Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF806F6549
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:52:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSoG-0006Aa-83; Thu, 04 May 2023 02:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puSoA-0006AO-Jx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puSo8-00024E-Dp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683183075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BMycvkEYwFC4khcp1fXKSnhfUKK8B/qFARTss42/LZc=;
 b=dr7oobJC2ag/rlOMOOrTpKZx3dapfTgR3e0TRimdiYYqv7x4DJNumoIFEUMELU/StC03Kp
 E2nfWCeFXsLSdB1wb1uXNkCQ1NgXrGEdksQ5NiqRoQAlClsRAQrdyP/SboU+Tfv17wJVAn
 gm2Oe4Ueo8xdVQzad0xTmuY/gWjukNg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-jZKBh0n7MbeIjxZLB7JOkg-1; Thu, 04 May 2023 02:51:13 -0400
X-MC-Unique: jZKBh0n7MbeIjxZLB7JOkg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94ec76d7a26so9642066b.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683183072; x=1685775072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BMycvkEYwFC4khcp1fXKSnhfUKK8B/qFARTss42/LZc=;
 b=lZvNvCxU1KCkHwV3880DizmVbT55ZhHEeW2FtgCs8j5rL9dtc6qwVWIPeh2p8rkdkV
 qJFgt8xQdoWGSG12QFboI62BGnGeW522rU1rgBg/Uyk3MCAiCHLcPFLVLsBAH6R2RAS6
 U1QnVcPdcac+aIJQbn6z6IPoBfZkU+FMuMlCIabF2UBJ9n1z35tgj84Gz9T48eWxKqSS
 buqAbVQZjIsd157zKUZiXAzg+iGUjaOaE8SaaOl2tJBIOHAicR8idTfoQnB66X1r2fw9
 st7dDtRZJZD3XE5UWRebrjw9bvuxb2f6NcdzbnNb4v/b0ZW0be7+WcbEh/4qHHdGBAPa
 vnzg==
X-Gm-Message-State: AC+VfDycroF7yezVWvQoNrlFoPcVMlMq1noKSYzrF6D1ihlu76KkhzCl
 ibGZSf0axBRD/NTInV4++brHyRpKlip9I1IQsViSajlGx43D53oZSUyaFN8dgv0L9HXPdLaea/V
 vaPV0K5X2MVKcTIY=
X-Received: by 2002:a17:907:2d12:b0:965:66dd:78f8 with SMTP id
 gs18-20020a1709072d1200b0096566dd78f8mr3504401ejc.56.1683183072146; 
 Wed, 03 May 2023 23:51:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Hcg3baCI2H7oO4ZeHzO/3pDx4vW1Ke3ou7q7gJdEmLGLEV26GP9cVdbmYj1R+RY3redr1uw==
X-Received: by 2002:a17:907:2d12:b0:965:66dd:78f8 with SMTP id
 gs18-20020a1709072d1200b0096566dd78f8mr3504392ejc.56.1683183071846; 
 Wed, 03 May 2023 23:51:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 jt11-20020a170906ca0b00b00958434d4ecesm15816926ejb.13.2023.05.03.23.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:51:11 -0700 (PDT)
Message-ID: <6aa44584-3a3a-e1b8-db7d-04dbbd82e68e@redhat.com>
Date: Thu, 4 May 2023 08:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Add information how to fix common build error on Windows
 in symlink-install-tree
Content-Language: en-US
To: Mateusz Krawczuk <mat.krawczuk@gmail.com>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230503150855.1182-1-mat.krawczuk@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503150855.1182-1-mat.krawczuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/05/2023 17.08, Mateusz Krawczuk wrote:
> By default, Windows doesn't allow to create soft links for user account and only administrator is allowed to do this. To fix this problem you have to raise your permissions or enable Developer Mode, which available since Windows 10. Additional explanation when build fails will allow developer to fix the problem on his computer faster.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1386
> Signed-off-by: Mateusz Krawczuk <mat.krawczuk@gmail.com>
> ---
>   scripts/symlink-install-tree.py | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
> index 67cb86dd52..bb3a2d708c 100644
> --- a/scripts/symlink-install-tree.py
> +++ b/scripts/symlink-install-tree.py
> @@ -7,12 +7,14 @@
>   import subprocess
>   import sys
>   
> +
>   def destdir_join(d1: str, d2: str) -> str:
>       if not d1:
>           return d2
>       # c:\destdir + c:\prefix must produce c:\destdir\prefix
>       return str(PurePath(d1, *PurePath(d2).parts[1:]))
>   
> +

Please avoid such white space damage. QEMU coding style is to use only one 
empty line between functions.

  Thomas


>   introspect = os.environ.get('MESONINTROSPECT')
>   out = subprocess.run([*introspect.split(' '), '--installed'],
>                        stdout=subprocess.PIPE, check=True).stdout
> @@ -28,5 +30,8 @@ def destdir_join(d1: str, d2: str) -> str:
>           os.symlink(source, bundle_dest)
>       except BaseException as e:
>           if not isinstance(e, OSError) or e.errno != errno.EEXIST:
> +            if os.name == 'nt':
> +                print('\nPlease enable Developer Mode to support soft link '
> +                      'without Administrator permission\n')
>               print(f'error making symbolic link {dest}', file=sys.stderr)
>               raise e


