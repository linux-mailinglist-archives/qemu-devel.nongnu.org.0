Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB6284B19
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 13:47:13 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPlR2-00005U-JN
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 07:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPlOl-0007as-HX
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPlOj-0000s2-RY
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601984685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UC4H0OfOfjg4XblicGApEAW+vcZez+hhYIQ/C2ZEHz4=;
 b=bt2Y4xw51cwWkrO+lOj+U/VjX9eVwKRBRQ7a0Bdcw1pk8xq1VQKB5r4eP560YfLIbMAPrB
 aimcW6+G6p4aRSEoFAk4opa6v9bjrdwB79js0iVhVEEU9Nc8SlpYztXqBG5pRWSbnZ2tTM
 eNLhOGLsqk7WDiYdN8nOHXmtjXd6wpU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-2IQ25qSsNgOlWpJpBkzByw-1; Tue, 06 Oct 2020 07:44:43 -0400
X-MC-Unique: 2IQ25qSsNgOlWpJpBkzByw-1
Received: by mail-wr1-f72.google.com with SMTP id r16so5220879wrm.18
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 04:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UC4H0OfOfjg4XblicGApEAW+vcZez+hhYIQ/C2ZEHz4=;
 b=fpKiGLJYP6IYz6Fobpm61gcfCG//u9yvzFrOfB2lWkac4bCU3+LJq/SsuRsX3JIqMf
 DIU04ER9Jp1vedJk0n7ma93gDoxBiYof/S1PCr1+nXE+lBO+ILu+FN1ihdjnp3vrpDTa
 oslCKVNE6XQ5IljCuWmwwuRRPTO573GRSQYwenCa0D6/cSsPJU6QUIxfsNtcFVfHkd/E
 lz/ChW5mnY2loTYcbBR8qZ/AMB1w2nIhHTy3A3AOuPvsdORspexoEQR1uMoWbTPE65lk
 71NDmPQHCQfNzzqOE07QzUNEMF/1lhH5Fmfl8NVyf5L4tmC9/O7FZSU5HxXbAjYw2m0x
 d99g==
X-Gm-Message-State: AOAM530q/JArGLX6QMt5KemshDyv6c2c/oQk2QdLLoSjhwz1HSLLy2cP
 DIFrRwRpB2BjiUstFyXlfubaMGY4/M/DgyuUWrac6XAW92MHiiFi5sM6F1WPbFlm0/9P2K8CBKl
 wNdWnktbOMYnh3oM=
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4147739wmd.146.1601984682490; 
 Tue, 06 Oct 2020 04:44:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBhvXBK1pe7I/ps1aw0xi3m0EqBjtWgX6ANiSsNVA1b/iKtCtMf0pv20u4JJ5FeocVy+OjHQ==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4147719wmd.146.1601984682321; 
 Tue, 06 Oct 2020 04:44:42 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 63sm4190564wrh.71.2020.10.06.04.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 04:44:41 -0700 (PDT)
Subject: Re: [PATCH v5 26/36] qapi/gen.py: Fix edge-case of _is_user_module
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-27-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a391f167-6ace-53d7-ce33-10d488bf6e7d@redhat.com>
Date: Tue, 6 Oct 2020 13:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005195158.2348217-27-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/20 9:51 PM, John Snow wrote:
> The edge case is that if the name is '', this expression returns a
> string instead of a bool, which violates our declared type.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  scripts/qapi/gen.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


