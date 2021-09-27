Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C844199B1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:51:09 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtqO-0008RN-TK
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUthI-0008K0-UO
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUthG-0002IM-34
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632760901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFbpX6etwoLvhpaPFTLgoW81CUlgt0xUr6wz2gzqb2E=;
 b=E0Z0B520ashdeVoz2E7dmhrGD7FEeFrAx4iFzcfjxIGT8qJkCZCUiovNGG+6lP4eMJwOfs
 Zkp3S4pnx1WvRNgcHljhrjJNCVy0EPB0KWRKSh7vETKTwozNA2sB+XAWD+Xvs2SymHpQkA
 uoTRdOPdcpudmzPu0zeu6ROmY+oim/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-y5HGwBX-Pteqe0BMKWt7_A-1; Mon, 27 Sep 2021 12:41:39 -0400
X-MC-Unique: y5HGwBX-Pteqe0BMKWt7_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 n3-20020a7bcbc3000000b0030b68c4de38so151147wmi.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dFbpX6etwoLvhpaPFTLgoW81CUlgt0xUr6wz2gzqb2E=;
 b=Oiil88wqVkX04FQ5a/MBVPAUFIxU31yn79iQSfem1BUFQuwm3bjaAUoOQASIYqWMFx
 hFwTm9Yg7DaKEyLrVt9JbKMaC8G1QVwdBO56YenR40LeXMFBl4L5L4P1oJRonCcoIE2/
 6S+XKttWx8bIEea1C/pMrKxdYfgmseFRnSd+7b9gLdM5gqhmkc55ImrPwm7R4ysnHGkO
 bZOpdbczPGacvaD0YMXFjazn8L063G6NoY04s80mUMJBViSBm7gGZJQHGp9wR7SQOQ6N
 pjx3pBixxQm9Cf9lr6sEUimugsEclbib6hmlkbJiex7fIn8ZhYRytvTpTZuTRprjAsCM
 9nog==
X-Gm-Message-State: AOAM531tX23JYXuOzHNG/c16tZCd9alDcYvg/xOnv1xcBZyrJrK5csVt
 1ZEIHGeatbx3qwB20VMMmgIMZaqwVLRe2CKTuzQPia9sqVdA4SbZbeTBnzLQDCCz1T73mGi7zIi
 aFDeknkydci9Z3Ek=
X-Received: by 2002:adf:de86:: with SMTP id w6mr930580wrl.287.1632760898264;
 Mon, 27 Sep 2021 09:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKz2O8OisHMu6zg2dCKn9JGQpsmkfVWjY3/scmfkF7E6ETfT9xjXX7ZN00Npl8J/fglLKTgg==
X-Received: by 2002:adf:de86:: with SMTP id w6mr930547wrl.287.1632760897949;
 Mon, 27 Sep 2021 09:41:37 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g21sm42294wmk.10.2021.09.27.09.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:41:37 -0700 (PDT)
Message-ID: <cc764788-fc18-5c0a-6eac-16b450567f5e@redhat.com>
Date: Mon, 27 Sep 2021 18:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/6] avocado_qemu: small fixes and tweaks
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210920204932.94132-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 22:49, Willian Rampazzo wrote:
> Standardize the super() calls according to PEP3135; fix import order based on
> isort; fix and tweak the ssh `connect` method; explicitly return None on
> `pick_default_qemu_bin` function to avoid linters R1710; and fix inheritance
> order on `LinuxTest` to avoid future problems.
> 
> Note: borrowed https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05117.html
>       for completeness.
> 
> Cleber Rosa (1):
>   Acceptance Tests: add standard clean up at test tearDown()
> 
> Willian Rampazzo (5):
>   avocado_qemu: standardize supper() call following PEP3135
>   avocado_qemu: fix import module based on isort
>   avocado_qemu: tweak ssh connect method
>   avocado_qemu: explicitly return None to avoid R1710
>   avocado_qemu: fix inheritance order on LinuxTest class

Thanks, applied to my integration-testing tree.


