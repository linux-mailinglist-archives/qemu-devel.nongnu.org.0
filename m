Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442737FB47
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:11:42 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDw5-0008KI-7w
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDsy-0003oR-NL; Thu, 13 May 2021 12:08:28 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDsw-0007If-Tz; Thu, 13 May 2021 12:08:28 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MwxNF-1lJNIu0Oxn-00yQjN; Thu, 13 May 2021 18:08:19 +0200
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
To: Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20210412170255.231406-1-sgarzare@redhat.com>
 <20210510155738.a4jk42yb2vqubblj@steredhat>
 <878s4lbziv.fsf@dusky.pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f08af7dd-b654-e226-3ab6-873c107e4041@vivier.eu>
Date: Thu, 13 May 2021 18:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s4lbziv.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RuNTEJsC3yuVvznSzDgUVel0rcp9sQ4HSgyARDjxSw/6eNZPO2E
 ZzE+yBvcnmBCUVUbJhCNQMmcdGSbXPfmLKD2fFcYOWFvJly0iK/5O/Gg0mpz8yVtr1ZCXQf
 FlCtAbxikU7O6nh30xcMtkb2djDLC1IacEJZg1hVtQsEZgtEehgzdt/mNSCpKjAwb7HCJ0s
 UTpl+cSf21O51icMIzutg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TlGABPrKKr0=:AceMKO+oXRl8nroCmKgGpv
 1BqmLz8OPd2XIQ4SCmXIdBkVyAjL7Xgcq3TPEmZCpxce78h1uaMXw6MTjeDqZ1Y0BWnaIFLqW
 Fnz7U7mQFISir5eC6/6LRyuyze6FIMZfV6bFTAdVXC1kquG8aCnsT060HB6iaCpCoJAmKr7TN
 n5/RyoCy15X7cSTzfHah0G45jTnySVOkxNeFhFqNyc7ZErj0A5WV+K+SsCQTdC6QmleQUkSlK
 UMX+GrcFoyBSJERS+or8g1KKTzKBO2Ucz6yW/sXZsGNEUMnf2O2kwSQVktxivCnHvd5bxFO2L
 pSDz8FixzXPuXqjs3r4ZOfhiJkbruRERhmmqQ2MJHBOn/f+7nxd9dZq0Nq/37y2zXPPy+9PAX
 sM+uQRJvmvv7D/NLlmJnzh2VU9OYU8ZyCFNNac9A58Ukfr9978b2gzYOgwBfoQ28RGT2wlUbj
 y1Oo7U+yJbI689FqIkvNsV90BoiruU+m31+dQy5zldINXKFu84PygAIs1AuODbInvvs8eLdio
 NOwSLl+/ZpzcxkGsis+zCM=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 07:38, Markus Armbruster a écrit :
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
>> Ping :-)
>>
>> Should I resend for 6.1?
> 
> I'm cc'ing qemu-trivial.
> 
> For good measure:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

