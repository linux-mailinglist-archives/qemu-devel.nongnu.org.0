Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6F419DB1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:58:11 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUutF-0006G2-SH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUurJ-0004S6-RJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUurI-0005Uq-44
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632765367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBf7S01ocTHacEhfeaKFAAzbXlcRPKPocPcpJhTKy6E=;
 b=HpbTS5MLwaKSUvcvveKEUz+al9gb9qzWqYbKJu4Bpj42ZPZCwhcKXcfY0FCQCe1lIrmhT7
 33TOagY3JrZZgR7R9yufjavIfY7QWyvWF0IfCaC4pNy+H8hbm/9YakoEMCe6wAPxg6t2Sd
 yADx6AJn46Mbzm5d8HzpOOMJowhryBE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-TP-GrgmtPve1KrFdXFHfxg-1; Mon, 27 Sep 2021 13:56:04 -0400
X-MC-Unique: TP-GrgmtPve1KrFdXFHfxg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so572790wmj.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=KBf7S01ocTHacEhfeaKFAAzbXlcRPKPocPcpJhTKy6E=;
 b=kDP434/nMlclA61kEZjJgBIVWockU/7t9cVjQsjPCbOCCdOIpq+tVljiV3V5FPVnGD
 tz6nSBJFQJsrVzsrfiQnznzaqc7jJRl49NqRHf+vyjhj6BEkKCy89IrELdF9H34aL3f2
 6Up5d0qWdwz+0F4kd2fMn4ESbhjVwIrnOAmxP8PSVd71u4FZYZZkSfl5Zv9bLn5kGYee
 1ZUHImc0zsNuaSZygkhOHXRvrphyrHNvL5FlfE2BYZZb+MfI3yOSQZmXHdHOAMtCSNF7
 fz3wZEcXnVAYn+SSAeduCGkoMMw+vVBA6sOVXdplMyozqfDRwRZDXUUjNm342HuiiW+y
 WnqQ==
X-Gm-Message-State: AOAM530HGsyaz0pTUhztzVv+zLCeVhyKYaX4KpZNFSSR/xXhkXD02p/y
 NIfIRe0/gKOWCa9UpqdHDHWGDc55TNbmuofsTBbnN11yCqORGpLONYuY+kznmDZhXWxYAAauCy9
 NSCJ0tYbaWDar3UqrZDnBIkA2ptr86sqwjdxCJtfY/rDCpM6NJ/76ykHGK1n1jiep
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr1408654wrs.58.1632765363136;
 Mon, 27 Sep 2021 10:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkWsNlV+Mw+xZwMUB9nAY6kKTuiKK3mPD6oLTI/bbJVLSJ8/SUrfoqSPvlyOdf8MAJtDvOeA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr1408643wrs.58.1632765362948;
 Mon, 27 Sep 2021 10:56:02 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c17sm205986wmr.15.2021.09.27.10.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:56:02 -0700 (PDT)
Message-ID: <f0cdca8b-2132-7d7e-a05a-37fb352dd3bd@redhat.com>
Date: Mon, 27 Sep 2021 19:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/21] Integration testing patches for 2021-09-27
To: qemu-devel <qemu-devel@nongnu.org>
References: <20210927170227.2014482-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/27/21 19:02, Philippe Mathieu-Daudé wrote:
> The following changes since commit de8ed1055c2ce18c95f597eb10df360dcb534f99:
> 
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-25-v2' into staging (2021-09-27 15:03:42 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/philmd/qemu.git tags/integration-testing-20210927
> 
> for you to fetch changes up to 6fdd5530d12c5b21cc05e7f44db95f6544bc3c17:
> 
>   tests/acceptance/ppc_prep_40p.py: clean up unused import (2021-09-27 18:55:46 +0200)
> 
> ----------------------------------------------------------------
> Integration testing patches
> 
> - More Linux kernel record/replay tests (Pavel Dovgalyuk)
> - Various fixes (Willian Rampazzo, Cleber Rosa)
> - Split machine_ppc.py per machine (David Gibson)
> - Add AVOCADO_TESTS command line environment variable (Willian Rampazzo)
> 
> ----------------------------------------------------------------

FYI I sent a v2 shortly after:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07010.html


