Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A9602125
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 04:26:39 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okcJR-0004V7-D6
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 22:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1okcFw-0001ti-79
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:23:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1okcFt-0007Fx-Qp
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:22:59 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I26se6017719;
 Tue, 18 Oct 2022 02:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=EqwgbTTfG5ZpABx9P55PIWFGacFtTwPMNk/6H2HZM/E=;
 b=hm/2svIeLOLF6ekRj+hPjv9IvctTV9ZkoRYEkC8VH0F6Pj2sQXWalB2xRFvi5+lvk/HO
 wqDXZgcWs8baIFDWwbXjMxnvUwapBp01HuyD7XWlu03VEnuiFc8atsg6UoqaseO09QH+
 qYZcY31wReS+23vSd4OzrnTmFxb3XvSAzGILfOion/VUPMQI3n7eyxw1nSi5aUJ4Zrwi
 w6cLAo9rEXRgbgUw+y14L8zkZbSNWUI6Lte1Axd1AeACi8Q6T8zAJUGBUc1jaWIXo/TV
 Wd8lX6rLYi76EqCfjKzdmanODf8VTt9DLOlDIL9zcN2WiIYzmRlkmE0lXM5XGtXpoFLK 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9g2t49yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 02:22:53 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29I2D9xX023966;
 Tue, 18 Oct 2022 02:22:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9g2t49y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 02:22:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29I2L6kM016983;
 Tue, 18 Oct 2022 02:22:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3k7m4jm983-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 02:22:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29I2Mmlv53805412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Oct 2022 02:22:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5678BA405C;
 Tue, 18 Oct 2022 02:22:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B15FA405B;
 Tue, 18 Oct 2022 02:22:48 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Oct 2022 02:22:47 +0000 (GMT)
Message-ID: <39000ad459f08256c95d3add81cab7549528fa57.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] tcg: add perfmap and jitdump
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Date: Tue, 18 Oct 2022 04:22:47 +0200
In-Reply-To: <cd7d0223-f539-982b-cc52-96b9c2f7b1ad@linaro.org>
References: <20221012051846.1432050-1-iii@linux.ibm.com>
 <20221012051846.1432050-2-iii@linux.ibm.com>
 <cd7d0223-f539-982b-cc52-96b9c2f7b1ad@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z5qhdvav2VYXRLBW2Z-AQWNB9e8DcZnQ
X-Proofpoint-GUID: rEh5V30tj3cX5luetQov0RKRIKw5Mzgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210180010
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-10-14 at 07:35 +1100, Richard Henderson wrote:
> On 10/12/22 22:18, Ilya Leoshkevich wrote:
> > Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
> > The first one allows the perf tool to map samples to each
> > individual
> > translation block. The second one adds the ability to resolve
> > symbol
> > names, line numbers and inspect JITed code.
> > 
> > Example of use:
> > 
> >      perf record qemu-x86_64 -perfmap ./a.out
> >      perf report
> > 
> > or
> > 
> >      perf record -k 1 qemu-x86_64 -jitdump ./a.out
> >      perf inject -j -i perf.data -o perf.data.jitted
> >      perf report -i perf.data.jitted
> > 
> > Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> > Co-developed-by: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> I think I remember this, and the question that was never answered
> was:
> 
> > @@ -1492,6 +1493,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >       }
> >       tb->tc.size = gen_code_size;
> >   
> > +    perf_report_code(gen_code_buf, gen_code_size, tb->icount, tb-
> > >pc);
> 
> When do_tb_flush is called, everything that is recorded in perfmap is
> invalidated.
> How do you tell perf about that?
> 
> 
> r~
> 

I don't think we should handle this altogether. Perf already knows how
to handle overlapping addresses:


$ cat main.c 
#include <dlfcn.h>
#include <stdio.h>
int main() 
{
    void *d = dlopen("./lib1.so", RTLD_NOW);
    void (*f)(void) = dlsym(d, "f");
    printf("%p\n", f);
    f();
    dlclose(d);
    d = dlopen("./lib2.so", RTLD_NOW);
    f = dlsym(d, "f");
    printf("%p\n", f);
    f();
    dlclose(d);
}

$ cat 1.c
static volatile int i = 0;

void f(void) {
    while (i < 1000000000) {
        i++;
    }
}

$ gcc -o main -O3 -g main.c -ldl
$ gcc -o lib1.so -shared -fPIC -O3 -g 1.c
$ cp 1.c 2.c
$ gcc -o lib2.so -shared -fPIC -O3 -g 2.c

$ perf record ./main
0x7f47925eb100
0x7f47925eb100

$ perf report
49.96%  main     lib1.so           [.] f
49.92%  main     lib2.so           [.] f


Note that there is "load" event - PERF_RECORD_MMAP2, but no "unload"
event. The old mappings are simply discarded by
maps__fixup_overlappings() when something new is mapped.

In our case this means that as soon as we JIT new code, perf will see
that it replaced the one that was flushed. Until then it will live with
stale mappings, but there is no harm in that, since they are not
executed.

