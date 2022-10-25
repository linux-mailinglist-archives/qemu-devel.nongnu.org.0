Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7080D60D51C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:03:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQ4S-0006Rb-NF; Tue, 25 Oct 2022 15:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1onQ4Q-0006RJ-Eu; Tue, 25 Oct 2022 15:58:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1onQ4O-0008N6-HO; Tue, 25 Oct 2022 15:58:42 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PIUbqa021265;
 Tue, 25 Oct 2022 19:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JWqb3y/z8GNZrZ7+5y77h4Ti0NUGbmfUZCdPQ5x7qbs=;
 b=fv9HUqFn0q1CSVfGVrUyfEVvj4a7KLQ/O0LYoPUZjJbjKkQe2Q2z4VLVjclkMEEfeJMS
 KXFHI0Yw2yGDWc3WTF9uI0Jco+7LLi/7nzrx1rO9teVGLq+W5RCzCbNUX9KM2Kt904Yp
 pf25PWt/DfyWeQVRfetypKxboMKQaMxfWHaBhup2Ns8PUJ6ItiDyxcwl/E3scImfgrv6
 Hnm5lw8rdFKx2s9060ALTG9qS2+pkLVR6N2A31nmUZysj0gDyUtrnWXIFWscvIkTqQG6
 sJL4XGaszo1bGGrknJxps/4mmvZzkcwAzBgbwypSaluwHpuKVSXbWwAPrhflv1SKeUTN PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee99aat3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 19:58:33 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29PJDT1O030628;
 Tue, 25 Oct 2022 19:58:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee99aasa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 19:58:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PJoe5p023216;
 Tue, 25 Oct 2022 19:58:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3kdugatt9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 19:58:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29PJx1JK34931074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 19:59:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02FE4AE051;
 Tue, 25 Oct 2022 19:58:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C817AE045;
 Tue, 25 Oct 2022 19:58:26 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.41.31]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Oct 2022 19:58:26 +0000 (GMT)
Message-ID: <ad2a9892184cd5dc7597d411f42e330558146acf.camel@linux.ibm.com>
Subject: Re: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU
 topology
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Tue, 25 Oct 2022 21:58:25 +0200
In-Reply-To: <20221012162107.91734-2-pmorel@linux.ibm.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w6Ws5AHCMyn7xTg-U1dvybSI5PjBpFpi
X-Proofpoint-ORIG-GUID: ZbYpU7S_91N_pPiML05QxnAavYt-s_Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_12,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2022-10-12 at 18:20 +0200, Pierre Morel wrote:
> In the S390x CPU topology the core_id specifies the CPU address
> and the position of the core withing the topology.
> 
> Let's build the topology based on the core_id.
> s390x/cpu topology: core_id sets s390x CPU topology
> 
> In the S390x CPU topology the core_id specifies the CPU address
> and the position of the cpu withing the topology.
> 
> Let's build the topology based on the core_id.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/hw/s390x/cpu-topology.h |  45 +++++++++++
>  hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c      |  21 +++++
>  hw/s390x/meson.build            |   1 +
>  4 files changed, 199 insertions(+)
>  create mode 100644 include/hw/s390x/cpu-topology.h
>  create mode 100644 hw/s390x/cpu-topology.c
> 
[...]

> +/**
> + * s390_topology_realize:
> + * @dev: the device state
> + * @errp: the error pointer (not used)
> + *
> + * During realize the machine CPU topology is initialized with the
> + * QEMU -smp parameters.
> + * The maximum count of CPU TLE in the all Topology can not be greater
> + * than the maximum CPUs.
> + */
> +static void s390_topology_realize(DeviceState *dev, Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    S390Topology *topo = S390_CPU_TOPOLOGY(dev);
> +
> +    topo->cpus = ms->smp.cores * ms->smp.threads;

Currently threads are not supported, effectively increasing the number of cpus,
so this is currently correct. Once the machine version limits the threads to 1,
it is also correct. However, once we support multiple threads, this becomes incorrect.
I wonder if it's ok from a backward compatibility point of view to modify the smp values
by doing cores *= threads, threads = 1 for old machines.
Then you can just use the cores value and it is always correct.
In any case, if you keep it as is, I'd like to see a comment here saying that this
is correct only so long as we don't support threads.
> +
> +    topo->socket = g_new0(S390TopoContainer, ms->smp.sockets);
> +    topo->tle = g_new0(S390TopoTLE, ms->smp.max_cpus);
> +
> +    topo->ms = ms;
> +}
> +
[...]

