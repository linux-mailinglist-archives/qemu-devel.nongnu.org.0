Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4D6EF098
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 11:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prb8i-00057X-AZ; Wed, 26 Apr 2023 05:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prb8g-000579-29
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prb8e-0003Id-74
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682500115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNMrChy28GwY/J3Ztl/zkhzgnOVyswJxNR7Aqv6Kb6I=;
 b=fdKymISVnzqU9RYCtuGhfqecWYyMVQ3qCWmBrQGXUrS5psMKcKNJTTGxIK3+1hYLdbrxUM
 UuKRX1IOGLDoAnYSTCx7pRFkxyi0FzPhZKSD2tNggrHFBNEwy/kx7BMQzClA/O8j3ATCG+
 Q7u1GYEVymPimzPB/HS84JExweVpWTY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-JaOMBU3CMoGgHWfbAwoA3g-1; Wed, 26 Apr 2023 05:08:34 -0400
X-MC-Unique: JaOMBU3CMoGgHWfbAwoA3g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-95836419a73so510395466b.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 02:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682500113; x=1685092113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNMrChy28GwY/J3Ztl/zkhzgnOVyswJxNR7Aqv6Kb6I=;
 b=B9t0ryUwnYeBU2JQXZ4Fx7Bk/HgJZ7zkp6EGR4Wy0c2AjZ3CDY8EAM5uolW8qEC2bc
 NYYbijLKhEL8OYXw4VX/8rio3l15k56jWkccxKrnR5We3X/LI3WGtyBFyH0VXsozDSEW
 MIMgAF/Jz1iUcjeL1KXWTfQQmCOR33PAxjut81LRxDiA/22QeUrsl7PEUei+y4lrBsj+
 ItYJq6bX2NPC3Q4RAZDBxtlV7zTyCtvzFFkkelHUoxLbqyxuPK2XsnDE6B8W089Jjcfk
 tSXwe9UyxYRvM5Rb+SsrvJTHJUqYgdvWW7KX/e6fp9BGRfK+BQYsKheDQIgXVYH6iof5
 n7Ag==
X-Gm-Message-State: AAQBX9ekKpD+5Jk4g+0UVcxF0Oox5IVz2KQez/XQsMw1SyoApfD9tkqR
 yY6qwan9ZheRI57yGK8O8igofPKNkCRVNCNFZD1PQosPztFcD4JbbRNYHRFCb/HxTG3kL5qLfak
 00QNJzOFukeNqXik=
X-Received: by 2002:a17:906:a191:b0:94e:5708:1564 with SMTP id
 s17-20020a170906a19100b0094e57081564mr15895681ejy.22.1682500112930; 
 Wed, 26 Apr 2023 02:08:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y0D3vTtFPMRQc7h4xR7Lj3wsz3bGCvCLy0GzLQFJjy9Tj36hPtTjuczZCQU5qOK9sjMHjwLQ==
X-Received: by 2002:a17:906:a191:b0:94e:5708:1564 with SMTP id
 s17-20020a170906a19100b0094e57081564mr15895657ejy.22.1682500112597; 
 Wed, 26 Apr 2023 02:08:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a170906a18400b0094f1d0bad81sm7847879ejy.139.2023.04.26.02.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 02:08:32 -0700 (PDT)
Message-ID: <1f69da1d-ef7a-40f9-7116-fdd572962543@redhat.com>
Date: Wed, 26 Apr 2023 11:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEjmo7dRO0Vwcmo5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZEjmo7dRO0Vwcmo5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/26/23 10:53, Daniel P. Berrangé wrote:
> I think it'd be useful for support purposes if the configure
> script summary printed details of how we setup the venv.
> eg perhaps a summary for each python module of whether we
> added it to the venv, or relied on te site packages:
> 
>     python venv: meson (site), sphinx (venv), avocado (venv)

Yes, I agree John did a great job with the errors but a little more work 
is needed to cleanup of mkvenv.py's logging of the "good" case.  The 
installation case is already covered by "pip install"'s output, but we 
need to have something like:

mkvenv: Creating {isolated|non-isolated} virtual environment [based on 
/home/pbonzini/myvenv]

and when creating the console-scripts shims:

mkvenv: Found avocado v90.0

Paolo


