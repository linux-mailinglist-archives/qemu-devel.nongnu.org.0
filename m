Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6F42A32F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:24:54 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFtt-0004En-Tm
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFGt-0008Q1-OX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFGq-0003Vh-1w
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634035470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0VbayPvPr3K82YatmPDypqO3r7ET7AR0N+W485gvCI=;
 b=dleF6ZP5IGCjVq4AGQiqHjKWoFvPViPx0fmhTmCkZwKkwn7q1etWh+1yvNzvvNYVDzPuLj
 croZuElO7y+mZmshcinKeUvnJCK3lDWcJYnzq9IEWYkv5HYSoVe8qcIhUMUoB8h/H9/lTc
 2cSx2RoXnFJnuvAVRWmOl/qbe4iMZE4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-d9YWM_E3NLyhdNynUZlqZA-1; Tue, 12 Oct 2021 06:44:29 -0400
X-MC-Unique: d9YWM_E3NLyhdNynUZlqZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so18558234edi.19
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q0VbayPvPr3K82YatmPDypqO3r7ET7AR0N+W485gvCI=;
 b=XhV19hkJoFVVam9agaSEyQKFvC+rp6y3BRjbaEb0LccOWite7r4UZE4nFjc1q6LOY0
 6tKxwCCJbxsxIiEcCJu8KvBdK3I1pH/4N6c9ZoqbGvYMNFsWtCstlg+EgSrsSrqi7E7F
 Ht26aGJ74g0sRSKqZgFLsYAqXbmpono2fEdrzqEFa1lMMz48rAdKQ7t24HhY52mKx/pZ
 zEqyRdO8+RCaNevJEb+PyDNAduQJu5GYKg6+VFVhK+mbCsBVlkczR4UCW+39VsRadC0A
 fow92FpAaW4TdbPKMBzBTj+3Zdn5h6GVhclqjP+/LI7415jjAd1puOBEbDYbqhnSFf8z
 k1Ig==
X-Gm-Message-State: AOAM531VGrR4xU7jbafqFpBiyezWH5LSoVLR2Za3zX9LILyYeLxDhOuT
 aWHHY4+Fkp2MRPg26F2Ci0WfqfpqTTrEPBPsKN5DkE7p9SD6dxEf4BojT15qWiVQTEdLsc82XiF
 mn2oO/BWs5YUrw20=
X-Received: by 2002:a50:cfc3:: with SMTP id i3mr48850421edk.36.1634035467816; 
 Tue, 12 Oct 2021 03:44:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuFbs24HKo2Q/06+50c6jEW/+6yjTgZvX6Miv0rsAKXoe6wD/zA5vIUuoMGTJDg4eR/Sl+Mg==
X-Received: by 2002:a50:cfc3:: with SMTP id i3mr48850385edk.36.1634035467635; 
 Tue, 12 Oct 2021 03:44:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z4sm6383784edd.46.2021.10.12.03.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:44:26 -0700 (PDT)
Message-ID: <734c1a1b-0acb-529c-6f6b-1302821c1630@redhat.com>
Date: Tue, 12 Oct 2021 12:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 01/12] configure, meson: override C compiler for cmake
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1633929457.git.jag.raman@oracle.com>
 <e903ca2df5d9bd22438ceeab9ae1a48083bb0db4.1633929457.git.jag.raman@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e903ca2df5d9bd22438ceeab9ae1a48083bb0db4.1633929457.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 alex.williamson@redhat.com, marcandre.lureau@gmail.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 07:31, Jagannathan Raman wrote:
> The compiler path that cmake gets from meson is corrupted. It results in
> the following error:
> | -- The C compiler identification is unknown
> | CMake Error at CMakeLists.txt:35 (project):
> | The CMAKE_C_COMPILER:
> | /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
> | is not a full path to an existing compiler tool.
> 
> Explicitly specify the C compiler for cmake to avoid this error
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   configure | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index 877bf3d76a..e804dfba2f 100755
> --- a/configure
> +++ b/configure
> @@ -5112,6 +5112,8 @@ if test "$skip_meson" = no; then
>     echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
>     echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
>     echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
> +  echo "[cmake]" >> $cross
> +  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>     echo "[binaries]" >> $cross
>     echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>     test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
> 

(This is fixed in Meson 0.60).

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


